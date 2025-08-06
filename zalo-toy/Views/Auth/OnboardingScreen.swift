import SwiftUI

struct OnboardingScreen: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Welcome!")
                .font(.largeTitle)
            
            NavigationLink("Go to Login", value: "login")
                .buttonStyle(.borderedProminent)

            NavigationLink("Go to Register", value: "register")
                .buttonStyle(.borderedProminent)
        }
        .navigationTitle("Onboarding")
    }
}
