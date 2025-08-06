import SwiftUI

struct RootView: View {
    @StateObject private var authManager = AuthManager()

    var body: some View {
        if authManager.isLoggedIn {
            AppStack()
                .environmentObject(authManager)
        } else {
            AuthStack()
                .environmentObject(authManager)
        }
    }
}


#Preview {
    RootView()
}
