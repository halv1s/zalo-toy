import SwiftUI

struct AuthStack: View {
    @State private var path = NavigationPath()

    var body: some View {
        NavigationStack(path: $path) {
            OnboardingScreen()
                .toolbar(.hidden)
                .navigationDestination(for: String.self) { screen in
                    if screen == "login" {
                        LoginScreen(path: $path)
                    } else if screen == "register" {
                        RegisterScreen(path: $path)
                    }
                }
        }
    }
}

#Preview {
    AuthStack()
}
