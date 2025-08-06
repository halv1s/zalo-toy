import SwiftUI

struct LoginScreen: View {
    @Binding var path: NavigationPath
    @EnvironmentObject private var authManager: AuthManager
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Login")
                .font(.largeTitle)
            
            Button("Login") {
                authManager.isLoggedIn = true
            }
            .buttonStyle(ZaloButtonStyle())
            
            Button("Don't have an account? Register here.") {
                path = NavigationPath(["register"])
            }
            .buttonStyle(ZaloButtonStyle())
        }
        .navigationTitle("Login")
    }
}

