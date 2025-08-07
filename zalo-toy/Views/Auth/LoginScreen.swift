import SwiftUI

struct LoginScreen: View {
    @Binding var path: NavigationPath
    @EnvironmentObject private var authManager: AuthManager
    @State private var phoneNumber: String = ""
    @State private var selectedCountryCode: String = "+84"
    @FocusState private var isPhoneNumberFocused: Bool
    
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 24) {
                Text("Enter your phone number")
                    .font(.system(size: 28, weight: .bold))
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                HStack(spacing: 0) {
                    HStack(spacing: 4) {
                        Text(selectedCountryCode)
                        Image(systemName: "chevron.down")
                            .font(.system(size: 14, weight: .medium))
                            .foregroundColor(.gray)
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 14)
                    .background(Color.clear)
                    .overlay(
                        UnevenRoundedRectangle(
                            topLeadingRadius: 8,
                            bottomLeadingRadius: 8
                        )
                        .stroke(isPhoneNumberFocused ? Color("ZaloB60Color") : Color.gray.opacity(0.3), lineWidth: isPhoneNumberFocused ? 2 : 1)
                    )
                    
                    TextField("XXX YYY ZZZ", text: $phoneNumber)
                        .focused($isPhoneNumberFocused)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 13)
                        .background(Color.clear)
                        .overlay(
                            UnevenRoundedRectangle(
                                bottomTrailingRadius: 8,
                                topTrailingRadius: 8
                            )
                            .stroke(isPhoneNumberFocused ? Color("ZaloB60Color") : Color.gray.opacity(0.3), lineWidth: isPhoneNumberFocused ? 2 : 1)
                        )
                        .overlay(
                            HStack {
                                Spacer()
                                if !phoneNumber.isEmpty {
                                    Button(action: {
                                        phoneNumber = ""
                                    }) {
                                        Image(systemName: "xmark.circle.fill")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 16))
                                    }
                                    .padding(.trailing, 12)
                                }
                            }
                        )
                }

                Button("Login") {
                    authManager.isLoggedIn = true
                }
                .buttonStyle(.zalo(variant: .primary, isFullWidth: true))
                .disabled(phoneNumber.isEmpty)
                .opacity(phoneNumber.isEmpty ? 0.6 : 1.0)
            }

            Spacer()

            HStack(spacing: 4) {
                Text("Don't have an account?")
                    .font(.system(size: 16))
                    .foregroundColor(.black)
                
                Button("Create new account") {
                    path = NavigationPath(["register"])
                }
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(Color("ZaloB60Color"))
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    path = NavigationPath()
                }) {
                    Image(systemName: "arrow.left")
                        .foregroundColor(.black)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .padding(.horizontal, AppConstants.Spacing.screenHorizontal)
        .padding(.vertical, AppConstants.Spacing.screenVertical)
    }
}

