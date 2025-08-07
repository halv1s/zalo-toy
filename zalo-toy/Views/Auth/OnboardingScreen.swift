import SwiftUI

struct TabContentItem: Identifiable {
    let id = UUID()
    let title: String
    let subtitle: String
}

struct OnboardingScreen: View {
    @State private var outerCurrentPage: Int = 0
    @State private var innerCurrentPage: Int = 0
    
    let tabContentData: [TabContentItem] = [
        TabContentItem(title: "Smooth video calls", subtitle: "Perform video calls with high-quality over all types of networks"),
        TabContentItem(title: "Convenient group chat", subtitle: "Stay connected with your team, family, and friends anytime, anywhere"),
        TabContentItem(title: "Quick photo sharing", subtitle: "Share photos in high quality with everyone easily"),
        TabContentItem(title: "Social timeline", subtitle: "Stay updated with latest activities of people you care about")
    ]
    
    var body: some View {
        VStack {
            TabView(selection: $outerCurrentPage) {
                VStack(spacing: 16) {
                    Text("Zalo")
                        .font(.system(size: 40, weight: .bold))
                        .foregroundStyle(Color("ZaloB60Color"))
                    
                    TabView(selection: $innerCurrentPage) {
                        ForEach(0..<tabContentData.count, id: \.self) { index in
                            VStack(spacing: 12) {
                                Text(tabContentData[index].title)
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .multilineTextAlignment(.center)
                                
                                Text(tabContentData[index].subtitle)
                                    .font(.body)
                                    .fontWeight(.medium)
                                    .foregroundColor(.gray)
                                    .multilineTextAlignment(.center)
                                    .padding(.horizontal, 32)
                            }
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .tag(index)
                        }
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                    .frame(height: 240)
                }
                .tag(0)
                .frame(height: 320)
                
                VStack {
                    Text("Zalo")
                        .font(.system(size: 64, weight: .bold))
                        .foregroundColor(Color("ZaloB60Color"))
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .tag(1)
                .frame(height: 320)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .frame(height: 320)
            .onChange(of: outerCurrentPage) { oldPage, newPage in
                if oldPage == 0 && newPage == 1 {
                    if innerCurrentPage != tabContentData.count - 1 {
                        withAnimation(.none) {
                            outerCurrentPage = 0
                        }
                    }
                }
            }
            
            HStack(spacing: 8) {
                ForEach(Array(0..<tabContentData.count + 1), id: \.self) { index in
                    Capsule()
                        .fill({
                            if outerCurrentPage == 0 {
                                return index == innerCurrentPage ? Color("ZaloB60Color") : Color.gray.opacity(0.5)
                            } else {
                                return index == tabContentData.count ? Color("ZaloB60Color") : Color.gray.opacity(0.5)
                            }
                        }())
                        .frame(width: {
                            if outerCurrentPage == 0 {
                                return index == innerCurrentPage ? 20 : 8
                            } else {
                                return index == tabContentData.count ? 20 : 8
                            }
                        }(), height: 8)
                        .animation(.spring(), value: innerCurrentPage)
                        .animation(.spring(), value: outerCurrentPage)
                }
            }
            .padding(.top, 16)
            
            Spacer()
            
            VStack(spacing: 16) {
                NavigationLink("Login", value: "login")
                    .buttonStyle(.zalo(variant: .primary, isFullWidth: true))
                
                NavigationLink("Create new account", value: "register")
                    .buttonStyle(.zalo(variant: .secondary, isFullWidth: true))
            }
        }
        .padding(.horizontal, AppConstants.Spacing.screenHorizontal)
        .padding(.vertical, AppConstants.Spacing.screenVertical)
    }
}

#Preview {
    NavigationStack {
        OnboardingScreen()
            .navigationBarHidden(true)
    }
}
