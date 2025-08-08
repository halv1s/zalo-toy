import SwiftUI

struct DiscoveryTab: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                AppTabHeader(
                    trailingActions: [
                        HeaderAction(icon: "qrcode.viewfinder") {
                            print("QR Code tapped in Discovery")
                        }
                    ],
                    onSearchTap: {
                        print("Search tapped in Discovery")
                    }
                )
                
                ScrollView {
                    VStack(spacing: AppConstants.Spacing.medium) {
                        VStack(spacing: 0) {
                            HStack(spacing: AppConstants.Spacing.large) {
                                Image(systemName: "play.rectangle.fill")
                                    .font(.title2)
                                    .foregroundColor(AppConstants.Colors.warning)
                                    .frame(width: AppConstants.IconSize.large, height: AppConstants.IconSize.large)
                                
                                VStack(alignment: .leading, spacing: 2) {
                                    Text("Zalo Video")
                                        .font(.system(size: AppConstants.FontSize.medium, weight: .medium))
                                        .foregroundColor(AppConstants.Colors.text)
                                    
                                    Text("[Popular] TUỔI NÀY KHÓ BẢO LẮM")
                                        .font(.system(size: AppConstants.FontSize.body))
                                        .foregroundColor(AppConstants.Colors.secondaryText)
                                }
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                                    .font(.system(size: AppConstants.FontSize.body, weight: .medium))
                                    .foregroundColor(AppConstants.Colors.secondaryText)
                                    .frame(width: AppConstants.IconSize.small, height: AppConstants.IconSize.small)
                            }
                            .padding(.horizontal, AppConstants.Spacing.screenHorizontal)
                            .padding(.vertical, AppConstants.Spacing.large)
                            .background(AppConstants.Colors.background)
                            
                            MenuItemRowDivider()
                            
                            MenuItemRow(
                                icon: "newspaper.fill",
                                iconColor: AppConstants.Colors.warning,
                                title: "News hub"
                            ) {
                                print("News hub tapped")
                            }
                            
                            MenuItemRowDivider()
                            
                            HStack(spacing: AppConstants.Spacing.large) {
                                Image(systemName: "gamecontroller.fill")
                                    .font(.title2)
                                    .foregroundColor(AppConstants.Colors.success)
                                    .frame(width: AppConstants.IconSize.large, height: AppConstants.IconSize.large)
                                
                                VStack(alignment: .leading, spacing: 2) {
                                    Text("Game Center")
                                        .font(.system(size: AppConstants.FontSize.medium, weight: .medium))
                                        .foregroundColor(AppConstants.Colors.text)
                                    
                                    Text("Thắng to - Thưởng lớn - Săn cá ngay!")
                                        .font(.system(size: AppConstants.FontSize.body))
                                        .foregroundColor(AppConstants.Colors.secondaryText)
                                }
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                                    .font(.system(size: AppConstants.FontSize.body, weight: .medium))
                                    .foregroundColor(AppConstants.Colors.secondaryText)
                                    .frame(width: AppConstants.IconSize.small, height: AppConstants.IconSize.small)
                            }
                            .padding(.horizontal, AppConstants.Spacing.screenHorizontal)
                            .padding(.vertical, AppConstants.Spacing.large)
                            .background(AppConstants.Colors.background)
                        }
                        
                        VStack(spacing: 0) {
                            MenuItemRow(
                                icon: "calendar",
                                iconColor: AppConstants.Colors.warning,
                                title: "Life services",
                                description: "Mobile top up, Pay bills, ..."
                            ) {
                                print("Life services tapped")
                            }
                            
                            MenuItemRowDivider()
                            
                            MenuItemRow(
                                icon: "circle.grid.3x3.fill",
                                iconColor: AppConstants.Colors.error,
                                title: "Financial utilities",
                                description: "TPBank loans, VIB cards, Gold price, ..."
                            ) {
                                print("Financial utilities tapped")
                            }
                            
                            MenuItemRowDivider()
                            
                            MenuItemRow(
                                icon: "briefcase.fill",
                                iconColor: AppConstants.Colors.zaloBrand,
                                title: "Find jobs",
                                description: "Post and find jobs near you"
                            ) {
                                print("Find jobs tapped")
                            }
                        }
                        
                        VStack(spacing: 0) {
                            MenuItemRow(
                                icon: "building.columns.fill",
                                iconColor: AppConstants.Colors.zaloBrand,
                                title: "e-Government"
                            ) {
                                print("e-Government tapped")
                            }
                            
                            MenuItemRowDivider()
                            
                            MenuItemRow(
                                icon: "square.stack.3d.up.fill",
                                iconColor: AppConstants.Colors.zaloBrand,
                                title: "Mini Apps"
                            ) {
                                print("Mini Apps tapped")
                            }
                        }
                    }
                }
                .background(AppConstants.Colors.zaloBackground)
            }
        }
    }
}

#Preview {
    DiscoveryTab()
}
