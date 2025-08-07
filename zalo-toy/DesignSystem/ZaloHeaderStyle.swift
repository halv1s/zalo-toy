import SwiftUI

struct HeaderAction {
    let icon: String
    let action: () -> Void
}

struct ZaloHeaderBackground: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.horizontal, AppConstants.Spacing.screenHorizontal)
            .padding(.vertical, 12)
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color("ZaloB60Color"),
                        Color("ZaloSK50Color")
                    ]),
                    startPoint: .leading,
                    endPoint: .trailing
                )
            )
    }
}
