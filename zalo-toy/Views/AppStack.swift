import SwiftUI

struct AppStack: View {
    var body: some View {
        TabView {
            Text("Messages Tab")
                .tabItem {
                    Label("Messages", systemImage: "message")
                }
            
            Text("Contacts Tab")
                .tabItem {
                    Label("Contacts", systemImage: "person.circle")
                }
            
            Text("Discovery Tab")
                .tabItem {
                    Label("Discovery", systemImage: "square.grid.2x2")
                }
            
            Text("Timeline Tab")
                .tabItem {
                    Label("Timeline", systemImage: "clock")
                }
            
            Text("Me Tab")
                .tabItem {
                    Label("Me", systemImage: "person")
                }
        }
    }
}

#Preview {
    AppStack()
}
