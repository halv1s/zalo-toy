import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var authManager: AuthManager
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack(spacing: 0) {
            StackHeader(
                title: "Settings",
                onBackTap: { dismiss() }
            )
            
            ScrollView {
                VStack(spacing: 8) {
                    VStack(spacing: 0) {
                        Button(action: {
                            authManager.logout()
                        }) {
                            HStack {
                                Image(systemName: "rectangle.portrait.and.arrow.right")
                                    .font(.system(size: 16))
                                    .foregroundColor(.red)
                                    .frame(width: 24, height: 24)
                                
                                Text("Logout")
                                    .font(.system(size: 16))
                                    .foregroundColor(.red)
                                
                                Spacer()
                            }
                            .padding(.horizontal, AppConstants.Spacing.screenHorizontal)
                            .padding(.vertical, 16)
                            .background(Color.white)
                        }
                    }
                }
                .padding(.top, 8)
            }
            .background(Color("ZaloNG20Color"))
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    NavigationView {
        SettingsView()
            .environmentObject(AuthManager())
    }
}
