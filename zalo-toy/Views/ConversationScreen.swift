import SwiftUI

struct ConversationScreen: View {
    let conversationId: String
    @StateObject private var viewModel: ConversationViewModel
    @State private var messageText = ""
    @Environment(\.dismiss) private var dismiss
    
    init(conversationId: String) {
        self.conversationId = conversationId
        self._viewModel = StateObject(wrappedValue: ConversationViewModel(conversationId: conversationId))
    }
    
    var body: some View {
        VStack(spacing: 0) {
            StackHeader(
                title: viewModel.conversationName,
                onBackTap: { 
                    dismiss() 
                },
                trailingActions: [
                    HeaderAction(icon: "video") {
                        print("Video call tapped")
                    },
                    HeaderAction(icon: "magnifyingglass") {
                        print("Search tapped")
                    },
                    HeaderAction(icon: "line.3.horizontal") {
                        print("Menu tapped")
                    }
                ]
            )
            
            ScrollView {
                LazyVStack(spacing: 16) {
                    if viewModel.isLoading {
                        VStack(spacing: 12) {
                            ProgressView()
                                .scaleEffect(1.2)
                            
                            Text("Loading messages...")
                                .font(.system(size: 14))
                                .foregroundColor(.secondary)
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .padding(.top, AppConstants.Spacing.screenVertical)
                    } else {
                        ForEach(Array(viewModel.messages.enumerated()), id: \.element.id) { index, message in
                            MessageBubbleView(
                                message: message, 
                                viewModel: viewModel,
                                previousMessage: index > 0 ? viewModel.messages[index - 1] : nil
                            )
                        }
                    }
                }
                .padding(.horizontal, AppConstants.Spacing.screenHorizontal)
                .padding(.vertical, 16)
            }
            .background(Color("ZaloNG20Color"))
            
            HStack(spacing: 8) {
                Button(action: {
                    print("Sticker tapped")
                }) {
                    Image(systemName: "face.smiling")
                        .font(.system(size: 20))
                        .foregroundColor(.gray)
                }
                
                HStack(spacing: 8) {
                    TextField("Message", text: $messageText)
                        .font(.system(size: 16))
                        .padding(.horizontal, 12)
                        .padding(.vertical, 10)
                    
                    if !messageText.isEmpty {
                        Button(action: {
                            viewModel.sendMessage(content: messageText)
                            messageText = ""
                        }) {
                            Image(systemName: "paperplane.fill")
                                .font(.system(size: 16))
                                .foregroundColor(.white)
                                .padding(8)
                                .background(Color("ZaloB60Color"))
                                .clipShape(Circle())
                        }
                        .padding(.trailing, 4)
                    }
                }
                .background(Color(.systemGray6))
                .cornerRadius(20)
                
                Button(action: {
                    print("More options tapped")
                }) {
                    Image(systemName: "ellipsis")
                        .font(.system(size: 16))
                        .foregroundColor(.gray)
                }
                
                Button(action: {
                    print("Voice message tapped")
                }) {
                    Image(systemName: "mic")
                        .font(.system(size: 20))
                        .foregroundColor(.gray)
                }
                
                Button(action: {
                    print("Image tapped")
                }) {
                    Image(systemName: "photo")
                        .font(.system(size: 20))
                        .foregroundColor(.orange)
                }
            }
            .padding(.horizontal, AppConstants.Spacing.screenHorizontal)
            .padding(.vertical, 12)
            .background(Color(.systemBackground))
        }
        .navigationBarHidden(true)
        .onAppear {
            viewModel.loadMessages()
        }
    }
}

struct MessageBubbleView: View {
    let message: ConversationMessage
    let viewModel: ConversationViewModel
    let previousMessage: ConversationMessage?
    
    var body: some View {
        VStack(spacing: 12) {
            if shouldShowDateSeparator() {
                Text(formatDate(message.timestamp))
                    .font(.system(size: 12, weight: .medium))
                    .foregroundColor(.white)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 4)
                    .background(Color.gray.opacity(0.6))
                    .cornerRadius(12)
            }
            
            HStack(alignment: .bottom, spacing: 8) {
                if message.isFromCurrentUser {
                    Spacer(minLength: 60)
                    
                    VStack(alignment: .trailing, spacing: 0) {
                        VStack(alignment: .trailing, spacing: 4) {
                            Text(message.content)
                                .font(.system(size: 16))
                                .foregroundColor(.primary)
                                .multilineTextAlignment(.trailing)
                            
                            Text(viewModel.formatMessageTime(message.timestamp))
                                .font(.system(size: 11))
                                .foregroundColor(.secondary)
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 10)
                        .background(Color("ZaloSK20Color"))
                        .cornerRadius(18, corners: [.topLeft, .topRight, .bottomLeft])
                    }
                } else {
                    Circle()
                        .fill(Color("ZaloSK50Color"))
                        .frame(width: 32, height: 32)
                        .overlay(
                            Text(String(message.senderName.prefix(2)).uppercased())
                                .font(.system(size: 12, weight: .medium))
                                .foregroundColor(.white)
                        )
                    
                    VStack(alignment: .leading, spacing: 0) {
                        VStack(alignment: .leading, spacing: 4) {
                            Text(message.content)
                                .font(.system(size: 16))
                                .foregroundColor(.primary)
                                .multilineTextAlignment(.leading)
                            
                            Text(viewModel.formatMessageTime(message.timestamp))
                                .font(.system(size: 11))
                                .foregroundColor(.secondary)
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 10)
                        .background(Color(.systemBackground))
                        .cornerRadius(18, corners: [.topLeft, .topRight, .bottomRight])
                    }
                    
                    Spacer(minLength: 60)
                }
            }
        }
    }
    
    private func shouldShowDateSeparator() -> Bool {
        guard let previousMessage = previousMessage else {
            // Always show date separator for the first message
            return true
        }
        
        // Show date separator if messages are more than 30 minutes apart
        let timeDifference = message.timestamp.timeIntervalSince(previousMessage.timestamp)
        return timeDifference >= 30 * 60 // 30 minutes in seconds
    }
    
    private func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm dd/MM/yyyy"
        return formatter.string(from: date)
    }
}

struct ConversationMessage: Identifiable {
    let id: String
    let content: String
    let timestamp: Date
    let isFromCurrentUser: Bool
    let senderId: String
    let senderName: String
}

#Preview {
    ConversationScreen(conversationId: "sample-conversation")
}
