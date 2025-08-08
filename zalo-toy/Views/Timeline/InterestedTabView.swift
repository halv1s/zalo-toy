import SwiftUI

struct InterestedTabView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: AppConstants.Spacing.large) {
                VStack(spacing: AppConstants.Spacing.extraLarge) {
                    HStack(spacing: AppConstants.Spacing.large) {
                        Circle()
                            .fill(AppConstants.Colors.iconDefault.opacity(0.3))
                            .frame(width: 44, height: 44)
                            .overlay(
                                Image(systemName: "person.fill")
                                    .font(.system(size: AppConstants.FontSize.title))
                                    .foregroundColor(AppConstants.Colors.iconDefault)
                            )
                        
                        Text("How are you today?")
                            .font(.system(size: AppConstants.FontSize.medium))
                            .foregroundColor(AppConstants.Colors.iconDefault)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    
                    HStack(spacing: AppConstants.Spacing.medium) {
                        ActionButton(
                            icon: "photo",
                            iconColor: AppConstants.Colors.success,
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
                            iconColor: AppConstants.Colors.zaloBrand,
                            title: "Album"
                        ) {
                            print("Album tapped")
                        }
                        
                        ActionButton(
                            icon: "clock.fill",
                            iconColor: AppConstants.Colors.warning,
                            title: "Memory"
                        ) {
                            print("Memory tapped")
                        }
                    }
                }
                .padding(.horizontal, AppConstants.Spacing.screenHorizontal)
                .padding(.vertical, AppConstants.Spacing.extraLarge)
                .background(AppConstants.Colors.background)
                
                VStack(alignment: .leading, spacing: AppConstants.Spacing.large) {
                    Text("Story")
                        .font(.system(size: AppConstants.FontSize.body, weight: .semibold))
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: AppConstants.Spacing.large) {
                            VStack(spacing: AppConstants.Spacing.medium) {
                                ZStack {
                                    Rectangle()
                                        .fill(AppConstants.Colors.zaloSecondary)
                                        .frame(width: 120, height: 160)
                                        .cornerRadius(AppConstants.CornerRadius.medium)
                                    
                                    VStack(spacing: AppConstants.Spacing.medium) {
                                        Spacer()
                                        Circle()
                                            .fill(AppConstants.Colors.zaloBrand)
                                            .frame(width: 40, height: 40)
                                            .overlay(
                                                Image(systemName: "pencil")
                                                    .font(.system(size: AppConstants.FontSize.medium, weight: .medium))
                                                    .foregroundColor(AppConstants.Colors.headerText)
                                            )
                                        Text("Create new")
                                            .font(.system(size: AppConstants.FontSize.small, weight: .medium))
                                            .foregroundColor(AppConstants.Colors.headerText)
                                    }
                                    .padding(.vertical, AppConstants.Spacing.large)
                                }
                            }
                            
                            VStack(spacing: AppConstants.Spacing.medium) {
                                ZStack {
                                    Rectangle()
                                        .fill(AppConstants.Colors.error.opacity(0.8))
                                        .frame(width: 120, height: 160)
                                        .cornerRadius(AppConstants.CornerRadius.medium)
                                    
                                    VStack {
                                        Spacer()
                                        Text("User B")
                                            .font(.system(size: AppConstants.FontSize.small, weight: .medium))
                                            .foregroundColor(AppConstants.Colors.headerText)
                                    }
                                    .padding(.vertical, AppConstants.Spacing.large)
                                }
                            }
                        }
                    }
                }
                .padding(.vertical, AppConstants.Spacing.extraLarge)
                .padding(.horizontal, AppConstants.Spacing.screenHorizontal)
                .background(AppConstants.Colors.background)
                
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
        .background(AppConstants.Colors.zaloBackground)
    }
}

struct ActionButton: View {
    let icon: String
    let iconColor: Color
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: AppConstants.Spacing.small + 2) {
                Image(systemName: icon)
                    .font(.system(size: AppConstants.FontSize.body))
                    .foregroundColor(iconColor)
                    .frame(width: AppConstants.FontSize.body, height: AppConstants.FontSize.body)
                
                Text(title)
                    .font(.system(size: AppConstants.FontSize.body))
                    .foregroundColor(AppConstants.Colors.text)
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, AppConstants.Spacing.medium)
        .background(AppConstants.Colors.zaloBackground)
        .clipShape(Capsule())
    }
}

#Preview {
    InterestedTabView()
}
