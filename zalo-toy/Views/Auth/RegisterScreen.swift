import SwiftUI

struct RegisterScreen: View {
    @Binding var path: NavigationPath
    @EnvironmentObject private var authManager: AuthManager
    @State private var phoneNumber: String = ""
    @State private var selectedCountryCode: String = "+84"
    @State private var agreeToTerms: Bool = false
    @State private var agreeToSocialTerms: Bool = false
    @FocusState private var isPhoneNumberFocused: Bool
    
    private var isFormValid: Bool {
        !phoneNumber.isEmpty && agreeToTerms && agreeToSocialTerms
    }
    
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
                        .stroke(isPhoneNumberFocused ? Color("ZaloBlueColor") : Color.gray.opacity(0.3), lineWidth: isPhoneNumberFocused ? 2 : 1)
                    )
                    
                    TextField("", text: $phoneNumber)
                        .focused($isPhoneNumberFocused)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 13)
                        .background(Color.clear)
                        .overlay(
                            UnevenRoundedRectangle(
                                bottomTrailingRadius: 8,
                                topTrailingRadius: 8
                            )
                            .stroke(isPhoneNumberFocused ? Color("ZaloBlueColor") : Color.gray.opacity(0.3), lineWidth: isPhoneNumberFocused ? 2 : 1)
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
                
                VStack(spacing: 16) {
                    HStack(spacing: 12) {
                        Button(action: {
                            agreeToTerms.toggle()
                        }) {
                            RoundedRectangle(cornerRadius: 4)
                                .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                                .frame(width: 20, height: 20)
                                .overlay(
                                    Image(systemName: "checkmark")
                                        .font(.system(size: 12, weight: .bold))
                                        .foregroundColor(.white)
                                        .opacity(agreeToTerms ? 1 : 0)
                                )
                                .background(
                                    RoundedRectangle(cornerRadius: 4)
                                        .fill(agreeToTerms ? Color("ZaloBlueColor") : Color.clear)
                                )
                        }
                        
                        HStack(spacing: 4) {
                            Text("I agree to")
                                .font(.system(size: 16))
                                .foregroundColor(.black)
                            
                            Button("Zalo Terms of Service") {
                                // Handle terms of service action
                            }
                            .font(.system(size: 16, weight: .medium))
                            .foregroundColor(Color("ZaloBlueColor"))
                        }
                        
                        Spacer()
                    }
                    
                    HStack(spacing: 12) {
                        Button(action: {
                            agreeToSocialTerms.toggle()
                        }) {
                            RoundedRectangle(cornerRadius: 4)
                                .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                                .frame(width: 20, height: 20)
                                .overlay(
                                    Image(systemName: "checkmark")
                                        .font(.system(size: 12, weight: .bold))
                                        .foregroundColor(.white)
                                        .opacity(agreeToSocialTerms ? 1 : 0)
                                )
                                .background(
                                    RoundedRectangle(cornerRadius: 4)
                                        .fill(agreeToSocialTerms ? Color("ZaloBlueColor") : Color.clear)
                                )
                        }
                        
                        HStack(spacing: 4) {
                            Text("I agree to")
                                .font(.system(size: 16))
                                .foregroundColor(.black)
                            
                            Button("Zalo's Social Terms of Service") {
                                // Handle social terms of service action
                            }
                            .font(.system(size: 16, weight: .medium))
                            .foregroundColor(Color("ZaloBlueColor"))
                        }
                        
                        Spacer()
                    }
                }

                Button("Next") {
                    authManager.isLoggedIn = true
                }
                .buttonStyle(.zalo(variant: .primary, isFullWidth: true))
                .disabled(!isFormValid)
                .opacity(isFormValid ? 1.0 : 0.6)
            }

            Spacer()

            HStack(spacing: 4) {
                Text("Already have an account?")
                    .font(.system(size: 16))
                    .foregroundColor(.black)
                
                Button("Log in") {
                    path = NavigationPath(["login"])
                }
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(Color("ZaloBlueColor"))
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
