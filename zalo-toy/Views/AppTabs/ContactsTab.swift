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
                .background(AppConstants.Colors.zaloBackground)
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
                    .font(.system(size: AppConstants.FontSize.medium, weight: .medium))
                    .foregroundColor(isSelected ? AppConstants.Colors.zaloBrand : AppConstants.Colors.iconDefault)
                    .padding(.vertical, AppConstants.Spacing.large)

                Rectangle()
                    .fill(isSelected ? AppConstants.Colors.zaloBrand : Color.clear)
                    .padding(.horizontal, AppConstants.Spacing.large)
                    .frame(height: 2)
            }
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    ContactsTab()
}
