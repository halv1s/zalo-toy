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
            HStack(spacing: 12) {
                Image(systemName: icon)
                    .font(.title2)
                    .foregroundColor(iconColor)
                    .frame(width: 24, height: 24)
                
                VStack(alignment: .leading, spacing: 2) {
                    Text(title)
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(.primary)
                    
                    if let description = description {
                        Text(description)
                            .font(.system(size: 14))
                            .foregroundColor(.secondary)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                if let rightIcon = rightIcon {
                    Image(systemName: rightIcon)
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(.secondary)
                        .frame(width: 16, height: 16)
                }
            }
            .padding(.horizontal, AppConstants.Spacing.screenHorizontal)
            .padding(.vertical, 12)
            .background(Color.white)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

struct MenuItemRowDivider: View {
    var body: some View {
        Divider()
            .padding(.leading, AppConstants.Spacing.screenHorizontal + 12 + 24)
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
