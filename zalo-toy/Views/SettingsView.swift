import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var authManager: AuthManager
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack(spacing: 0) {
            StackHeader(
                title: "Settings",
                onBackTap: { 
                    dismiss() 
                }
            )
            
            ScrollView {                
                VStack(spacing: AppConstants.Spacing.medium) {
                    VStack(spacing: 0) {
                        MenuItemRow(
                            icon: "shield",
                            title: "Account and security"
                        ) {
                            print("Account and security tapped")
                        }
                        
                        MenuItemRowDivider() 
                        
                        MenuItemRow(
                            icon: "lock",
                            title: "Privacy"
                        ) {
                            print("Privacy tapped")
                        }
                    }

                    VStack(spacing: 0) {
                        MenuItemRow(
                            icon: "internaldrive",
                            title: "Data on device"
                        ) {
                            print("Data on device tapped")
                        }
                        
                        MenuItemRowDivider() 
                        
                        MenuItemRow(
                            icon: "icloud.and.arrow.up",
                            title: "Backup and restore"
                        ) {
                            print("Backup and restore tapped")
                        }
                    }

                    VStack(spacing: 0) {
                        MenuItemRow(
                            icon: "bell",
                            title: "Notifications"
                        ) {
                            print("Notifications tapped")
                        }
                        
                        MenuItemRowDivider() 
                        
                        MenuItemRow(
                            icon: "message",
                            title: "Messages"
                        ) {
                            print("Messages tapped")
                        }

                        MenuItemRowDivider()

                        MenuItemRow(
                            icon: "phone",
                            title: "Calls"
                        ) {
                            print("Calls tapped")
                        }
                        
                        MenuItemRowDivider() 
                        
                        MenuItemRow(
                            icon: "clock",
                            title: "Timeline"
                        ) {
                            print("Timeline tapped")
                        }

                        MenuItemRowDivider() 
                        
                        MenuItemRow(
                            icon: "person.2",
                            title: "Contacts"
                        ) {
                            print("Contacts tapped")
                        }

                        MenuItemRowDivider() 
                        
                        MenuItemRow(
                            icon: "paintbrush",
                            title: "Theme and language"
                        ) {
                            print("Theme and language tapped")
                        }
                    }

                    VStack {
                        Button(action: {
                            authManager.logout()
                        }) {
                            HStack {
                                Image(systemName: "rectangle.portrait.and.arrow.right")
                                    .font(.system(size: AppConstants.FontSize.medium))
                                    .foregroundColor(AppConstants.Colors.error)
                                    .frame(width: AppConstants.IconSize.large, height: AppConstants.IconSize.large)
                                
                                Text("Logout")
                                    .font(.system(size: AppConstants.FontSize.medium))
                                    .foregroundColor(AppConstants.Colors.error)
                                
                                Spacer()
                            }
                            .padding(.horizontal, AppConstants.Spacing.screenHorizontal)
                            .padding(.vertical, AppConstants.Spacing.extraLarge)
                            .background(AppConstants.Colors.background)
                        }
                    }
                }
            }
            .background(AppConstants.Colors.zaloBackground)
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    NavigationView {
        SettingsView()
            .environmentObject(AuthManager())
    }
}
