import SwiftUI

struct PostView: View {
    let authorName: String
    let authorAvatar: String
    let timeStamp: String
    let content: String
    let imageUrl: String?
    let likeCount: Int
    let commentCount: Int
    
    var body: some View {
        VStack(alignment: .leading, spacing: AppConstants.Spacing.large) {
            HStack(spacing: AppConstants.Spacing.large) {
                Circle()
                    .fill(AppConstants.Colors.iconDefault.opacity(0.3))
                    .frame(width: 44, height: 44)
                    .overlay(
                        Image(systemName: "person.fill")
                            .font(.system(size: AppConstants.FontSize.title))
                            .foregroundColor(AppConstants.Colors.iconDefault)
                    )
                
                VStack(alignment: .leading, spacing: 2) {
                    Text(authorName)
                        .font(.system(size: AppConstants.FontSize.medium, weight: .medium))
                        .foregroundColor(AppConstants.Colors.text)
                    
                    Text(timeStamp)
                        .font(.system(size: AppConstants.FontSize.small))
                        .foregroundColor(AppConstants.Colors.secondaryText)
                }
                
                Spacer()
                
                Button(action: {
                    print("Menu tapped")
                }) {
                    Image(systemName: "ellipsis")
                        .font(.system(size: AppConstants.FontSize.medium))
                        .foregroundColor(AppConstants.Colors.secondaryText)
                }
            }
            
            Text(content)
                .font(.system(size: AppConstants.FontSize.body))
                .foregroundColor(AppConstants.Colors.text)
                .multilineTextAlignment(.leading)
            
            if let _ = imageUrl {
                Rectangle()
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [Color.orange, Color.red, Color.purple]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(height: 200)
                    .cornerRadius(AppConstants.CornerRadius.medium)
            }
            
            HStack(spacing: AppConstants.Spacing.xxLarge) {
                Button(action: {
                    print("Like tapped")
                }) {
                    HStack(spacing: AppConstants.Spacing.small + 2) {
                        Image(systemName: "heart")
                            .font(.system(size: AppConstants.FontSize.medium))
                            .foregroundColor(AppConstants.Colors.secondaryText)
                        
                        Text("Like")
                            .font(.system(size: AppConstants.FontSize.body))
                            .foregroundColor(AppConstants.Colors.secondaryText)
                    }
                }
                
                Button(action: {
                    print("Comment tapped")
                }) {
                    HStack(spacing: AppConstants.Spacing.small + 2) {
                        Image(systemName: likeCount > 0 ? "heart.fill" : "heart")
                            .font(.system(size: AppConstants.FontSize.medium))
                            .foregroundColor(likeCount > 0 ? AppConstants.Colors.error : AppConstants.Colors.secondaryText)
                        
                        if likeCount > 0 {
                            Text("\(likeCount)")
                                .font(.system(size: AppConstants.FontSize.body))
                                .foregroundColor(AppConstants.Colors.error)
                        }
                    }
                }
                
                Button(action: {
                    print("Comment tapped")
                }) {
                    HStack(spacing: AppConstants.Spacing.small + 2) {
                        Image(systemName: "message")
                            .font(.system(size: AppConstants.FontSize.medium))
                            .foregroundColor(AppConstants.Colors.secondaryText)
                        
                        if commentCount > 0 {
                            Text("\(commentCount)")
                                .font(.system(size: AppConstants.FontSize.body))
                                .foregroundColor(AppConstants.Colors.secondaryText)
                        }
                    }
                }
                
                Spacer()
                
                if likeCount > 0 {
                    HStack(spacing: 0) {
                        Circle()
                            .fill(Color("ZaloB20Color"))
                            .frame(width: 20, height: 20)
                            .overlay(
                                Image(systemName: "person.fill")
                                    .font(.system(size: AppConstants.FontSize.body))
                                    .foregroundColor(AppConstants.Colors.headerText)
                            )

                        if likeCount > 1 {
                            Circle()
                                .fill(Color("ZaloNG10Color"))
                                .frame(width: AppConstants.IconSize.medium, height: AppConstants.IconSize.medium)
                                .overlay(
                                    Text("+\(likeCount - 1)")
                                        .font(.system(size: 8, weight: .medium))
                                        .foregroundColor(AppConstants.Colors.text)
                                )
                                .overlay(
                                    Circle()
                                        .stroke(AppConstants.Colors.headerText, lineWidth: 1)
                                )
                        }
                    }
                }
            }
        }
        .padding(.horizontal, AppConstants.Spacing.screenHorizontal)
        .padding(.vertical, AppConstants.Spacing.extraLarge)
        .background(AppConstants.Colors.background)
    }
}

#Preview {
    PostView(
        authorName: "Sarah Johnson",
        authorAvatar: "person.fill",
        timeStamp: "2 hours ago",
        content: "Had an amazing time at our company retreat last weekend! The team building activities were fantastic and we got to know each other so much better. Looking forward to implementing all the great ideas we discussed.\n\nThank you everyone for making it such a memorable experience! 🎉✨...See more",
        imageUrl: "team_photo",
        likeCount: 24,
        commentCount: 5
    )
}
