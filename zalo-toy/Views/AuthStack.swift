import SwiftUI

struct AuthStack: View {
    @EnvironmentObject private var authManager: AuthManager

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Text("Login Screen")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Button("Log In") {
                    authManager.isLoggedIn = true
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
            .navigationTitle("Auth")
        }
    }
}
