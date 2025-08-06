import SwiftUI

struct RegisterScreen: View {
    @Binding var path: NavigationPath
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Login")
                .font(.largeTitle)
            
            Button("Already have an account? Log in.") {
                path = NavigationPath(["login"])
            }
        }
        .navigationTitle("Register")
    }
}
