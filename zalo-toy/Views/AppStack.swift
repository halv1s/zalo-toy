import SwiftUI

struct AppStack: View {
    @State private var selectedTab = 0
    
    init() {
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithOpaqueBackground()
        tabBarAppearance.backgroundColor = UIColor(named: "ZaloSTB10Color")
        tabBarAppearance.shadowColor = UIColor.black.withAlphaComponent(0.2)
        UITabBar.appearance().tintColor = UIColor(named: "ZaloB60Color")
        UITabBar.appearance().standardAppearance = tabBarAppearance
        UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
    }
    
    var body: some View {
        TabView(selection: $selectedTab) {
            MessagesTab()
                .tabItem {
                    if selectedTab == 0 {
                        Label("Messages", systemImage: "message")
                    } else {
                        Image(systemName: "message")
                    }
                }
                .tag(0)
            
            ContactsTab()
                .tabItem {
                    if selectedTab == 1 {
                        Label("Contacts", systemImage: "person.circle")
                    } else {
                        Image(systemName: "person.circle")
                    }
                }
                .tag(1)
            
            DiscoveryTab()
                .tabItem {
                    if selectedTab == 2 {
                        Label("Discovery", systemImage: "square.grid.2x2")
                    } else {
                        Image(systemName: "square.grid.2x2")
                    }
                }
                .tag(2)
            
            TimelineTab()
                .tabItem {
                    if selectedTab == 3 {
                        Label("Timeline", systemImage: "clock")
                    } else {
                        Image(systemName: "clock")
                    }
                }
                .tag(3)
            
            MeTab()
                .tabItem {
                    if selectedTab == 4 {
                        Label("Me", systemImage: "person")
                    } else {
                        Image(systemName: "person")
                    }
                }
                .tag(4)
        }
        .id(selectedTab)
    }
}

#Preview {
    AppStack()
}
