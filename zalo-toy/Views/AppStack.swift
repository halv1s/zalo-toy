import SwiftUI

struct AppStack: View {
    @EnvironmentObject private var authManager: AuthManager

    var body: some View {
        TabView {
            NavigationView {
                VStack(spacing: 20) {
                    Text("Welcome to the Main App!")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    Button("Log Out") {
                        authManager.isLoggedIn = false
                    }
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
                .navigationTitle("Main App")
            }
            .tabItem { Label("Home", systemImage: "house.fill") }
            
            
            Text("Settings Tab")
                .tabItem { Label("Settings", systemImage: "gearshape.fill") }
        }
    }
}
