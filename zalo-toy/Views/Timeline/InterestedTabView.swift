import SwiftUI

struct InterestedTabView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 12) {
                VStack(spacing: 16) {
                    HStack(spacing: 12) {
                        Circle()
                            .fill(Color.gray.opacity(0.3))
                            .frame(width: 44, height: 44)
                            .overlay(
                                Image(systemName: "person.fill")
                                    .font(.system(size: 20))
                                    .foregroundColor(.gray)
                            )
                        
                        Text("How are you today?")
                            .font(.system(size: 16))
                            .foregroundColor(.gray)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    
                    HStack(spacing: 8) {
                        ActionButton(
                            icon: "photo",
                            iconColor: .green,
                            title: "Photo"
                        ) {
                            print("Photo tapped")
                        }
                        
                        ActionButton(
                            icon: "video.fill",
                            iconColor: .pink,
                            title: "Video"
                        ) {
                            print("Video tapped")
                        }
                        
                        ActionButton(
                            icon: "photo.stack",
                            iconColor: Color("ZaloB60Color"),
                            title: "Album"
                        ) {
                            print("Album tapped")
                        }
                        
                        ActionButton(
                            icon: "clock.fill",
                            iconColor: .orange,
                            title: "Memory"
                        ) {
                            print("Memory tapped")
                        }
                    }
                }
                .padding(.horizontal, AppConstants.Spacing.screenHorizontal)
                .padding(.vertical, 16)
                .background(Color(.systemBackground))
                
                VStack(alignment: .leading, spacing: 12) {
                    Text("Story")
                        .font(.system(size: 14, weight: .semibold))
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 12) {
                            VStack(spacing: 8) {
                                ZStack {
                                    Rectangle()
                                        .fill(Color("ZaloSK50Color"))
                                        .frame(width: 120, height: 160)
                                        .cornerRadius(12)
                                    
                                    VStack(spacing: 8) {
                                        Spacer()
                                        Circle()
                                            .fill(Color("ZaloB60Color"))
                                            .frame(width: 40, height: 40)
                                            .overlay(
                                                Image(systemName: "pencil")
                                                    .font(.system(size: 16, weight: .medium))
                                                    .foregroundColor(.white)
                                            )
                                        Text("Create new")
                                            .font(.system(size: 12, weight: .medium))
                                            .foregroundColor(.white)
                                    }
                                    .padding(.vertical, 12)
                                }
                            }
                            
                            VStack(spacing: 8) {
                                ZStack {
                                    Rectangle()
                                        .fill(Color.red.opacity(0.8))
                                        .frame(width: 120, height: 160)
                                        .cornerRadius(12)
                                    
                                    VStack {
                                        Spacer()
                                        Text("User B")
                                            .font(.system(size: 12, weight: .medium))
                                            .foregroundColor(.white)
                                    }
                                    .padding(.vertical, 12)
                                }
                            }
                        }
                    }
                }
                .padding(.vertical, 16)
                .padding(.horizontal, AppConstants.Spacing.screenHorizontal)
                .background(Color(.systemBackground))
                
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
        }
        .background(Color("ZaloNG20Color"))
    }
}

struct ActionButton: View {
    let icon: String
    let iconColor: Color
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: 6) {
                Image(systemName: icon)
                    .font(.system(size: 14))
                    .foregroundColor(iconColor)
                    .frame(width: 14, height: 14)
                
                Text(title)
                    .font(.system(size: 14))
                    .foregroundColor(.primary)
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 8)
        .background(Color("ZaloNG20Color"))
        .clipShape(Capsule())
    }
}

#Preview {
    InterestedTabView()
}
