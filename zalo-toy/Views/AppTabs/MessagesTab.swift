import SwiftUI

struct MessagesTab: View {
    @EnvironmentObject private var authManager: AuthManager
    @StateObject private var viewModel = MessagesViewModel()
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
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
                                viewModel: viewModel,
                                onTap: {
                                    path.append("conversation-\(viewModel.messages[index].conversationId)")
                                }
                            )
                        }
                    }
                }
            }
            .navigationDestination(for: String.self) { destination in
                if destination.hasPrefix("conversation-") {
                    let conversationId = String(destination.dropFirst("conversation-".count))
                    ConversationScreen(conversationId: conversationId)
                        .toolbar(.hidden, for: .tabBar)
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
    let onTap: () -> Void
    
    var body: some View {
        HStack(spacing: AppConstants.Spacing.large) {
            Circle()
                .fill(Color.gray.opacity(0.3))
                .frame(width: 50, height: 50)
                .overlay(
                    Text(String(message.conversationName.prefix(1)))
                        .font(.title2)
                        .fontWeight(.medium)
                        .foregroundColor(.gray)
                )
            
            VStack(alignment: .leading, spacing: AppConstants.Spacing.small) {
                HStack {
                    Text(message.conversationName)
                        .font(.system(size: AppConstants.FontSize.medium, weight: .medium))
                        .foregroundColor(.primary)
                    
                    Spacer()
                    
                    Text(viewModel.getTimeString(for: message))
                        .font(.system(size: AppConstants.FontSize.small))
                        .foregroundColor(.secondary)
                }
                
                HStack {
                    Text(viewModel.getDisplayContent(for: message))
                        .font(.system(size: AppConstants.FontSize.body))
                        .foregroundColor(.secondary)
                        .lineLimit(1)
                    
                    Spacer()
                    
                    if !viewModel.isMessageRead(message) {
                        Circle()
                            .fill(Color.red)
                            .frame(width: AppConstants.IconSize.small + 2, height: AppConstants.IconSize.small + 2)
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
        .padding(.horizontal, AppConstants.Spacing.screenHorizontal)
        .padding(.vertical, AppConstants.Spacing.large)
        .background(Color(.systemBackground))
        .onTapGesture {
            onTap()
        }
    }
}
