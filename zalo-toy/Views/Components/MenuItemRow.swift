import SwiftUI

struct MenuItemRow: View {
    let icon: String
    let iconColor: Color
    let title: String
    let description: String?
    let rightIcon: String?
    let action: () -> Void
    
    init(
        icon: String,
        iconColor: Color = Color("ZaloB70Color"),
        title: String,
        description: String? = nil,
        rightIcon: String? = "chevron.right",
        action: @escaping () -> Void = {}
    ) {
        self.icon = icon
        self.iconColor = iconColor
        self.title = title
        self.description = description
        self.rightIcon = rightIcon
        self.action = action
    }
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: AppConstants.Spacing.extraLarge) {
                Image(systemName: icon)
                    .font(.system(size: AppConstants.FontSize.title))
                    .foregroundColor(iconColor)
                    .frame(width: AppConstants.IconSize.medium, height: AppConstants.IconSize.medium)
                
                VStack(alignment: .leading, spacing: 2) {
                    Text(title)
                        .font(.system(size: AppConstants.FontSize.medium, weight: .medium))
                        .foregroundColor(.primary)
                    
                    if let description = description {
                        Text(description)
                            .font(.system(size: AppConstants.FontSize.body))
                            .foregroundColor(.secondary)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                if let rightIcon = rightIcon {
                    Image(systemName: rightIcon)
                        .font(.system(size: AppConstants.FontSize.body, weight: .medium))
                        .foregroundColor(.secondary)
                        .frame(width: AppConstants.IconSize.small, height: AppConstants.IconSize.small)
                }
            }
            .padding(.horizontal, AppConstants.Spacing.screenHorizontal)
            .padding(.vertical, AppConstants.Spacing.extraLarge)
            .background(Color(.systemBackground))
        }
        .buttonStyle(PlainButtonStyle())
    }
}

struct MenuItemRowDivider: View {
    var body: some View {
        Divider()
            .padding(.leading, AppConstants.Spacing.screenHorizontal + AppConstants.Spacing.large + AppConstants.IconSize.large)
    }
}

#Preview {
    VStack(spacing: 0) {
        MenuItemRow(
            icon: "person.circle",
            title: "Profile",
            description: "Manage your profile"
        ) {
            print("Profile tapped")
        }
        
        Divider()
        
        MenuItemRow(
            icon: "bell",
            title: "Notifications"
        ) {
            print("Notifications tapped")
        }
    }
}
