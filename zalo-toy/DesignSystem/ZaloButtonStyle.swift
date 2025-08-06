import SwiftUI

struct ZaloButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.horizontal, 24)
            .padding(.vertical, 12)
            .background(Color("PrimaryColor"))
            .foregroundColor(Color.white)
            .cornerRadius(24)
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
    }
}
