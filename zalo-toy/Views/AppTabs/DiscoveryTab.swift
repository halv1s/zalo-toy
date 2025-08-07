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
                    VStack(spacing: 8) {
                        VStack(spacing: 0) {
                            HStack(spacing: 12) {
                                Image(systemName: "play.rectangle.fill")
                                    .font(.title2)
                                    .foregroundColor(.orange)
                                    .frame(width: 24, height: 24)
                                
                                VStack(alignment: .leading, spacing: 2) {
                                    Text("Zalo Video")
                                        .font(.system(size: 16, weight: .medium))
                                        .foregroundColor(.primary)
                                    
                                    Text("[Popular] TUỔI NÀY KHÓ BẢO LẮM")
                                        .font(.system(size: 14))
                                        .foregroundColor(.secondary)
                                }
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                                    .font(.system(size: 14, weight: .medium))
                                    .foregroundColor(.secondary)
                                    .frame(width: 16, height: 16)
                            }
                            .padding(.horizontal, AppConstants.Spacing.screenHorizontal)
                            .padding(.vertical, 12)
                            .background(Color(.systemBackground))
                            
                            MenuItemRowDivider()
                            
                            MenuItemRow(
                                icon: "newspaper.fill",
                                iconColor: .orange,
                                title: "News hub"
                            ) {
                                print("News hub tapped")
                            }
                            
                            MenuItemRowDivider()
                            
                            HStack(spacing: 12) {
                                Image(systemName: "gamecontroller.fill")
                                    .font(.title2)
                                    .foregroundColor(.green)
                                    .frame(width: 24, height: 24)
                                
                                VStack(alignment: .leading, spacing: 2) {
                                    Text("Game Center")
                                        .font(.system(size: 16, weight: .medium))
                                        .foregroundColor(.primary)
                                    
                                    Text("Thắng to - Thưởng lớn - Săn cá ngay!")
                                        .font(.system(size: 14))
                                        .foregroundColor(.secondary)
                                }
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                                    .font(.system(size: 14, weight: .medium))
                                    .foregroundColor(.secondary)
                                    .frame(width: 16, height: 16)
                            }
                            .padding(.horizontal, AppConstants.Spacing.screenHorizontal)
                            .padding(.vertical, 12)
                            .background(Color(.systemBackground))
                        }
                        
                        VStack(spacing: 0) {
                            MenuItemRow(
                                icon: "calendar",
                                iconColor: .orange,
                                title: "Life services",
                                description: "Mobile top up, Pay bills, ..."
                            ) {
                                print("Life services tapped")
                            }
                            
                            MenuItemRowDivider()
                            
                            MenuItemRow(
                                icon: "circle.grid.3x3.fill",
                                iconColor: .red,
                                title: "Financial utilities",
                                description: "TPBank loans, VIB cards, Gold price, ..."
                            ) {
                                print("Financial utilities tapped")
                            }
                            
                            MenuItemRowDivider()
                            
                            MenuItemRow(
                                icon: "briefcase.fill",
                                iconColor: Color("ZaloB60Color"),
                                title: "Find jobs",
                                description: "Post and find jobs near you"
                            ) {
                                print("Find jobs tapped")
                            }
                        }
                        
                        VStack(spacing: 0) {
                            MenuItemRow(
                                icon: "building.columns.fill",
                                iconColor: Color("ZaloB60Color"),
                                title: "e-Government"
                            ) {
                                print("e-Government tapped")
                            }
                            
                            MenuItemRowDivider()
                            
                            MenuItemRow(
                                icon: "square.stack.3d.up.fill",
                                iconColor: Color("ZaloB60Color"),
                                title: "Mini Apps"
                            ) {
                                print("Mini Apps tapped")
                            }
                        }
                    }
                }
                .background(Color("ZaloNG20Color"))
            }
        }
    }
}

#Preview {
    DiscoveryTab()
}
