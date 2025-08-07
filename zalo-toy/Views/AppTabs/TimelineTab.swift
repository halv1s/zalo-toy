import SwiftUI

struct TimelineTab: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                AppTabHeader(
                    trailingActions: [
                        HeaderAction(icon: "photo.badge.plus") {
                            print("New post tapped")
                        },
                        HeaderAction(icon: "bell") {
                            print("Notifications tapped")
                        }
                    ],
                    onSearchTap: {
                        print("Search tapped in Timeline")
                    }
                )
                
                ScrollView {
                    VStack {
                        Text("Timeline Tab")
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
    TimelineTab()
}
