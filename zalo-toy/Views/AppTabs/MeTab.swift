import SwiftUI

struct MeTab: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                AppTabHeader(
                    trailingActions: [
                        HeaderAction(icon: "gearshape") {
                            print("Settings tapped")
                        }
                    ],
                    onSearchTap: {
                        print("Search tapped in Me")
                    }
                )
                
                ScrollView {
                    VStack {
                        Text("Me Tab")
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
    MeTab()
}
