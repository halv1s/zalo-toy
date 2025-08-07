import SwiftUI

enum ButtonVariant {
    case primary
    case secondary
}

struct ZaloButtonStyle: ButtonStyle {
    var variant: ButtonVariant
    var isFullWidth: Bool = false
    
    func makeBody(configuration: Configuration) -> some View {
        var backgroundColor: Color {
            switch variant {
            case .primary:
                return Color("ZaloBlueColor")
            case .secondary:
                return Color("ZaloLightNeutralColor")
            }
        }
            
        var foregroundColor: Color {
            switch variant {
            case .primary:
                return .white
            case .secondary:
                return .black
            }
        }
            
        return configuration.label
            .padding(.horizontal, 24)
            .padding(.vertical, 12)
            .frame(maxWidth: isFullWidth ? .infinity : nil)
            .background(backgroundColor)
            .foregroundColor(foregroundColor)
            .font(.system(size: 17, weight: .semibold))
            .cornerRadius(24)
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
    }
}

extension ButtonStyle where Self == ZaloButtonStyle {
    static func zalo(variant: ButtonVariant, isFullWidth: Bool = false) -> ZaloButtonStyle {
        return ZaloButtonStyle(variant: variant, isFullWidth: isFullWidth)
    }
}
