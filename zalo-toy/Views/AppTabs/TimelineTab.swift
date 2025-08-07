import SwiftUI

struct TimelineTab: View {
    @State private var selectedTab = 0
    
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
                
                HStack(spacing: 0) {
                    TimelineTabButton(title: "Interested", isSelected: selectedTab == 0) {
                        selectedTab = 0
                    }
                    TimelineTabButton(title: "Other", isSelected: selectedTab == 1) {
                        selectedTab = 1
                    }
                }
                
                TabView(selection: $selectedTab) {
                    InterestedTabView()
                        .tag(0)
                    
                    OtherTabView()
                        .tag(1)
                }
                .background(Color("ZaloNG20Color"))
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            }
        }
    }
}

struct TimelineTabButton: View {
    let title: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack(spacing: 0) {
                Text(title)
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(isSelected ? Color("ZaloB60Color") : .gray)
                    .padding(.vertical, 12)

                Rectangle()
                    .fill(isSelected ? Color("ZaloB60Color") : Color.clear)
                    .padding(.horizontal, 12)
                    .frame(height: 2)
            }
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    TimelineTab()
}
