import SwiftUI

struct ContactsTab: View {
    @State private var selectedTab = 0
    @StateObject private var viewModel = ContactsViewModel()
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                AppTabHeader(
                    trailingActions: [
                        HeaderAction(icon: "person.badge.plus") {
                            print("Add contact tapped")
                        }
                    ],
                    onSearchTap: {
                        print("Search tapped in Contacts")
                    }
                )
                
                HStack(spacing: 0) {
                    TabButton(title: "Friends", isSelected: selectedTab == 0) {
                        selectedTab = 0
                    }
                    TabButton(title: "Groups", isSelected: selectedTab == 1) {
                        selectedTab = 1
                    }
                    TabButton(title: "OA", isSelected: selectedTab == 2) {
                        selectedTab = 2
                    }
                }
                
                TabView(selection: $selectedTab) {
                    FriendsTabView(viewModel: viewModel)
                        .tag(0)
                    
                    GroupsTabView()
                        .tag(1)
                    
                    OATabView()
                        .tag(2)
                }
                .background(Color("ZaloNG20Color"))
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            }
        }
    }
}

struct TabButton: View {
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
    ContactsTab()
}
