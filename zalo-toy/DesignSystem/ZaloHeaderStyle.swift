import SwiftUI

struct HeaderAction {
    let icon: String
    let action: () -> Void
}

struct ZaloHeaderBackground: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.horizontal, AppConstants.Spacing.screenHorizontal)
            .padding(.vertical, AppConstants.Spacing.large)
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [
                        AppConstants.Colors.zaloBrand,
                        AppConstants.Colors.zaloSecondary
                    ]),
                    startPoint: .leading,
                    endPoint: .trailing
                )
            )
    }
}
