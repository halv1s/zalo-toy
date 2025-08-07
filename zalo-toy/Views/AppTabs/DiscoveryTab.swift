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
                    VStack {
                        Text("Discovery Tab")
                            .font(.title2)
                            .foregroundColor(.primary)
                        
                        Spacer()
                    }
                    .padding()
                }
            }
        }
    }
}

#Preview {
    DiscoveryTab()
}
