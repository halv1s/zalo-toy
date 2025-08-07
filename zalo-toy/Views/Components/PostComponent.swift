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
        VStack(alignment: .leading, spacing: 12) {
            HStack(spacing: 12) {
                Circle()
                    .fill(Color.gray.opacity(0.3))
                    .frame(width: 44, height: 44)
                    .overlay(
                        Image(systemName: "person.fill")
                            .font(.system(size: 20))
                            .foregroundColor(.gray)
                    )
                
                VStack(alignment: .leading, spacing: 2) {
                    Text(authorName)
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(.primary)
                    
                    Text(timeStamp)
                        .font(.system(size: 12))
                        .foregroundColor(.secondary)
                }
                
                Spacer()
                
                Button(action: {
                    print("Menu tapped")
                }) {
                    Image(systemName: "ellipsis")
                        .font(.system(size: 16))
                        .foregroundColor(.secondary)
                }
            }
            
            Text(content)
                .font(.system(size: 14))
                .foregroundColor(.primary)
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
                    .cornerRadius(8)
            }
            
            HStack(spacing: 20) {
                Button(action: {
                    print("Like tapped")
                }) {
                    HStack(spacing: 6) {
                        Image(systemName: "heart")
                            .font(.system(size: 16))
                            .foregroundColor(.secondary)
                        
                        Text("Like")
                            .font(.system(size: 14))
                            .foregroundColor(.secondary)
                    }
                }
                
                Button(action: {
                    print("Comment tapped")
                }) {
                    HStack(spacing: 6) {
                        Image(systemName: likeCount > 0 ? "heart.fill" : "heart")
                            .font(.system(size: 16))
                            .foregroundColor(likeCount > 0 ? .red : .secondary)
                        
                        if likeCount > 0 {
                            Text("\(likeCount)")
                                .font(.system(size: 14))
                                .foregroundColor(.red)
                        }
                    }
                }
                
                Button(action: {
                    print("Comment tapped")
                }) {
                    HStack(spacing: 6) {
                        Image(systemName: "message")
                            .font(.system(size: 16))
                            .foregroundColor(.secondary)
                        
                        if commentCount > 0 {
                            Text("\(commentCount)")
                                .font(.system(size: 14))
                                .foregroundColor(.secondary)
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
                                    .font(.system(size: 14))
                                    .foregroundColor(.white)
                            )

                        if likeCount > 1 {
                            Circle()
                                .fill(Color("ZaloNG10Color"))
                                .frame(width: 20, height: 20)
                                .overlay(
                                    Text("+\(likeCount - 1)")
                                        .font(.system(size: 8, weight: .medium))
                                        .foregroundColor(.black)
                                )
                                .overlay(
                                    Circle()
                                        .stroke(Color.white, lineWidth: 1)
                                )
                        }
                    }
                }
            }
        }
        .padding(.horizontal, AppConstants.Spacing.screenHorizontal)
        .padding(.vertical, 16)
        .background(Color(.systemBackground))
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
