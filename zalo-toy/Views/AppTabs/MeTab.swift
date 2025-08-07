import SwiftUI

struct MeTab: View {
    @State private var navigateToSettings = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                AppTabHeader(
                    trailingActions: [
                        HeaderAction(icon: "gearshape") {
                            navigateToSettings = true
                        }
                    ],
                    onSearchTap: {
                        print("Search tapped in Me")
                    }
                )
                
                ScrollView {
                    VStack(spacing: 8) {
                        VStack(spacing: 0) {
                            HStack(spacing: 12) {
                                Circle()
                                    .fill(Color.gray.opacity(0.3))
                                    .frame(width: 48, height: 48)
                                    .overlay(
                                        Image(systemName: "person.fill")
                                            .font(.system(size: 24))
                                            .foregroundColor(.gray)
                                    )
                                
                                VStack(alignment: .leading, spacing: 2) {
                                    Text("User")
                                        .font(.system(size: 16, weight: .medium))
                                        .foregroundColor(.primary)
                                    
                                    Text("View my profile")
                                        .font(.system(size: 14))
                                        .foregroundColor(.secondary)
                                }
                                
                                Spacer()
                                
                                Image(systemName: "arrow.swap")
                                    .font(.system(size: 14, weight: .medium))
                                    .foregroundColor(Color("ZaloB70Color"))
                                    .frame(width: 16, height: 16)
                            }
                            .padding(.horizontal, AppConstants.Spacing.screenHorizontal)
                            .padding(.vertical, 16)
                            .background(Color.white)
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
                .background(Color("ZaloNG20Color"))
                
                NavigationLink(
                    destination: SettingsView(),
                    isActive: $navigateToSettings
                ) {
                    EmptyView()
                }
                .hidden()
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

#Preview {
    MeTab()
}
