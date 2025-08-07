import SwiftUI

struct MessagesTab: View {
    @EnvironmentObject private var authManager: AuthManager
    @StateObject private var viewModel = MessagesViewModel()
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                AppTabHeader(
                    trailingActions: [
                        HeaderAction(icon: "qrcode.viewfinder") {
                            print("QR Code tapped in Messages")
                        },
                        HeaderAction(icon: "plus") {
                            print("New message tapped")
                        }
                    ],
                    onSearchTap: {
                        print("Search tapped in Messages")
                    }
                )
                
                ScrollView {
                    LazyVStack(spacing: 0) {
                        ForEach(viewModel.messages.indices, id: \.self) { index in
                            MessageRowView(
                                message: viewModel.messages[index],
                                viewModel: viewModel
                            )
                        }
                    }
                }
            }
        }
        .onAppear {
            viewModel.updateCurrentUser(authManager.currentUserId ?? "")
        }
        .onChange(of: authManager.currentUserId ?? "") { oldValue, newValue in
            viewModel.updateCurrentUser(newValue)
        }
    }
}

struct MessageRowView: View {
    let message: MessagePreview
    let viewModel: MessagesViewModel
    
    var body: some View {
        HStack(spacing: 12) {
            Circle()
                .fill(Color.gray.opacity(0.3))
                .frame(width: 50, height: 50)
                .overlay(
                    Text(String(message.conversationName.prefix(1)))
                        .font(.title2)
                        .fontWeight(.medium)
                        .foregroundColor(.gray)
                )
            
            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Text(message.conversationName)
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(.primary)
                    
                    Spacer()
                    
                    Text(viewModel.getTimeString(for: message))
                        .font(.system(size: 12))
                        .foregroundColor(.secondary)
                }
                
                HStack {
                    Text(viewModel.getDisplayContent(for: message))
                        .font(.system(size: 14))
                        .foregroundColor(.secondary)
                        .lineLimit(1)
                    
                    Spacer()
                    
                    if !viewModel.isMessageRead(message) {
                        Circle()
                            .fill(Color.red)
                            .frame(width: 18, height: 18)
                            .overlay(
                                Text(String(message.newMessageCount))
                                    .font(.system(size: 10, weight: .medium))
                                    .foregroundColor(.white)
                            )
                    }
                }
            }
            
            Spacer()
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 12)
        .background(Color.white)
        .onTapGesture {
            // Handle message tap
        }
    }
}

#Preview {
    MessagesTab()
}
