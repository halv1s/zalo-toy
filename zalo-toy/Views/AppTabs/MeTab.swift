import SwiftUI

struct MeTab: View {
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack(spacing: 0) {
                AppTabHeader(
                    trailingActions: [
                        HeaderAction(icon: "gearshape") {
                            path.append("settings")
                        }
                    ],
                    onSearchTap: {
                        print("Search tapped in Me")
                    }
                )
                
                ScrollView {
                    VStack(spacing: AppConstants.Spacing.medium) {
                        VStack(spacing: 0) {
                            HStack(spacing: AppConstants.Spacing.large) {
                                Circle()
                                    .fill(AppConstants.Colors.iconDefault.opacity(0.3))
                                    .frame(width: 48, height: 48)
                                    .overlay(
                                        Image(systemName: "person.fill")
                                            .font(.system(size: AppConstants.FontSize.largeTitle))
                                            .foregroundColor(AppConstants.Colors.iconDefault)
                                    )
                                
                                VStack(alignment: .leading, spacing: 2) {
                                    Text("User")
                                        .font(.system(size: AppConstants.FontSize.medium, weight: .medium))
                                        .foregroundColor(AppConstants.Colors.text)
                                    
                                    Text("View my profile")
                                        .font(.system(size: AppConstants.FontSize.body))
                                        .foregroundColor(AppConstants.Colors.secondaryText)
                                }
                                
                                Spacer()
                                
                                Image(systemName: "arrow.swap")
                                    .font(.system(size: AppConstants.FontSize.body, weight: .medium))
                                    .foregroundColor(AppConstants.Colors.iconActive)
                                    .frame(width: AppConstants.IconSize.small, height: AppConstants.IconSize.small)
                            }
                            .padding(.horizontal, AppConstants.Spacing.screenHorizontal)
                            .padding(.vertical, AppConstants.Spacing.extraLarge)
                            .background(AppConstants.Colors.background)
                        }
                        
                        VStack(spacing: 0) {
                            MenuItemRow(
                                icon: "icloud",
                                title: "My Cloud",
                                description: "Keep important messages"
                            ) {
                                print("My Cloud tapped")
                            }
                            
                            MenuItemRowDivider() 
                            
                            MenuItemRow(
                                icon: "chart.pie",
                                title: "Data on device",
                                description: "Manage your Zalo data"
                            ) {
                                print("Data on device tapped")
                            }
                            
                            MenuItemRowDivider() 
                            
                            MenuItemRow(
                                icon: "qrcode",
                                title: "QR Wallet",
                                description: "Keep important QR codes",
                                rightIcon: nil
                            ) {
                                print("QR Wallet tapped")
                            }
                        }
                        
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
                    }
                }
                .background(AppConstants.Colors.zaloBackground)
            }
            .navigationDestination(for: String.self) { destination in
                if destination == "settings" {
                    SettingsView()
                        .toolbar(.hidden, for: .tabBar)
                }
            }
        }
    }
}

#Preview {
    MeTab()
}
