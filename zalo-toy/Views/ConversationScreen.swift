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
                LazyVStack(spacing: AppConstants.Spacing.extraLarge) {
                    if viewModel.isLoading {
                        VStack(spacing: AppConstants.Spacing.large) {
                            ProgressView()
                                .scaleEffect(1.2)
                            
                            Text("Loading messages...")
                                .font(.system(size: AppConstants.FontSize.body))
                                .foregroundColor(AppConstants.Colors.secondaryText)
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
                .padding(.vertical, AppConstants.Spacing.screenVertical)
            }
            .background(AppConstants.Colors.zaloBackground)
            
            HStack(spacing: AppConstants.Spacing.medium) {
                Button(action: {
                    print("Sticker tapped")
                }) {
                    Image(systemName: "face.smiling")
                        .font(.system(size: AppConstants.FontSize.title))
                        .foregroundColor(AppConstants.Colors.iconDefault)
                }
                
                HStack(spacing: AppConstants.Spacing.medium) {
                    TextField("Message", text: $messageText)
                        .font(.system(size: AppConstants.FontSize.medium))
                        .padding(.horizontal, AppConstants.Spacing.large)
                        .padding(.vertical, 10)
                    
                    if !messageText.isEmpty {
                        Button(action: {
                            viewModel.sendMessage(content: messageText)
                            messageText = ""
                        }) {
                            Image(systemName: "paperplane.fill")
                                .font(.system(size: AppConstants.FontSize.medium))
                                .foregroundColor(AppConstants.Colors.headerText)
                                .padding(AppConstants.Spacing.medium)
                                .background(AppConstants.Colors.buttonPrimary)
                                .clipShape(Circle())
                        }
                        .padding(.trailing, AppConstants.Spacing.small)
                    }
                }
                .background(AppConstants.Colors.inputBackground)
                .cornerRadius(AppConstants.CornerRadius.pill)
                
                Button(action: {
                    print("More options tapped")
                }) {
                    Image(systemName: "ellipsis")
                        .font(.system(size: AppConstants.FontSize.medium))
                        .foregroundColor(AppConstants.Colors.iconDefault)
                }
                
                Button(action: {
                    print("Voice message tapped")
                }) {
                    Image(systemName: "mic")
                        .font(.system(size: AppConstants.FontSize.title))
                        .foregroundColor(AppConstants.Colors.iconDefault)
                }
                
                Button(action: {
                    print("Image tapped")
                }) {
                    Image(systemName: "photo")
                        .font(.system(size: AppConstants.FontSize.title))
                        .foregroundColor(AppConstants.Colors.warning)
                }
            }
            .padding(.horizontal, AppConstants.Spacing.screenHorizontal)
            .padding(.vertical, AppConstants.Spacing.large)
            .background(AppConstants.Colors.background)
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
        VStack(spacing: AppConstants.Spacing.large) {
            if shouldShowDateSeparator() {
                Text(formatDate(message.timestamp))
                    .font(.system(size: AppConstants.FontSize.small, weight: .medium))
                    .foregroundColor(AppConstants.Colors.headerText)
                    .padding(.horizontal, AppConstants.Spacing.large)
                    .padding(.vertical, AppConstants.Spacing.small)
                    .background(AppConstants.Colors.iconDefault.opacity(0.6))
                    .cornerRadius(AppConstants.CornerRadius.medium)
            }
            
            HStack(alignment: .bottom, spacing: AppConstants.Spacing.medium) {
                if message.isFromCurrentUser {
                    Spacer(minLength: 60)
                    
                    VStack(alignment: .trailing, spacing: 0) {
                        VStack(alignment: .trailing, spacing: AppConstants.Spacing.small) {
                            Text(message.content)
                                .font(.system(size: AppConstants.FontSize.medium))
                                .foregroundColor(AppConstants.Colors.text)
                                .multilineTextAlignment(.trailing)
                            
                            Text(viewModel.formatMessageTime(message.timestamp))
                                .font(.system(size: AppConstants.FontSize.caption))
                                .foregroundColor(AppConstants.Colors.secondaryText)
                        }
                        .padding(.horizontal, AppConstants.Spacing.extraLarge)
                        .padding(.vertical, 10)
                        .background(AppConstants.Colors.zaloAccent)
                        .cornerRadius(AppConstants.CornerRadius.extraLarge, corners: [.topLeft, .topRight, .bottomLeft])
                    }
                } else {
                    Circle()
                        .fill(AppConstants.Colors.zaloSecondary)
                        .frame(width: AppConstants.IconSize.extraLarge, height: AppConstants.IconSize.extraLarge)
                        .overlay(
                            Text(String(message.senderName.prefix(2)).uppercased())
                                .font(.system(size: AppConstants.FontSize.small, weight: .medium))
                                .foregroundColor(AppConstants.Colors.headerText)
                        )
                    
                    VStack(alignment: .leading, spacing: 0) {
                        VStack(alignment: .leading, spacing: AppConstants.Spacing.small) {
                            Text(message.content)
                                .font(.system(size: AppConstants.FontSize.medium))
                                .foregroundColor(AppConstants.Colors.text)
                                .multilineTextAlignment(.leading)
                            
                            Text(viewModel.formatMessageTime(message.timestamp))
                                .font(.system(size: AppConstants.FontSize.caption))
                                .foregroundColor(AppConstants.Colors.secondaryText)
                        }
                        .padding(.horizontal, AppConstants.Spacing.extraLarge)
                        .padding(.vertical, 10)
                        .background(AppConstants.Colors.background)
                        .cornerRadius(AppConstants.CornerRadius.extraLarge, corners: [.topLeft, .topRight, .bottomRight])
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
