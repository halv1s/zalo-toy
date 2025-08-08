import Foundation
import SwiftUI

struct AppConstants {
    struct Spacing {
        static let screenHorizontal: CGFloat = 20.0
        static let screenVertical: CGFloat = 16.0
        
        static let small: CGFloat = 4.0
        static let medium: CGFloat = 8.0
        static let large: CGFloat = 12.0
        static let extraLarge: CGFloat = 16.0
        static let xxLarge: CGFloat = 20.0
    }
    
    struct FontSize {
        static let caption: CGFloat = 11.0
        static let small: CGFloat = 12.0
        static let body: CGFloat = 14.0
        static let medium: CGFloat = 16.0
        static let large: CGFloat = 18.0
        static let title: CGFloat = 20.0
        static let largeTitle: CGFloat = 24.0
    }
    
    struct CornerRadius {
        static let small: CGFloat = 8.0
        static let medium: CGFloat = 12.0
        static let large: CGFloat = 16.0
        static let extraLarge: CGFloat = 18.0
        static let pill: CGFloat = 20.0
    }
    
    struct IconSize {
        static let small: CGFloat = 16.0
        static let medium: CGFloat = 20.0
        static let large: CGFloat = 24.0
        static let extraLarge: CGFloat = 32.0
    }
    
    struct Colors {
        // Brand colors
        static let zaloBrand = Color("ZaloB60Color")
        static let zaloAccent = Color("ZaloSK20Color")
        static let zaloSecondary = Color("ZaloSK50Color")
        static let zaloBackground = Color("ZaloNG20Color")
        
        // UI colors
        static let background = Color(.systemBackground)
        static let secondaryBackground = Color(.secondarySystemBackground)
        static let text = Color(.label)
        static let secondaryText = Color(.secondaryLabel)
        static let tertiaryText = Color(.tertiaryLabel)
        static let separator = Color(.separator)
        
        // Status colors
        static let success = Color.green
        static let error = Color.red
        static let warning = Color.orange
        
        // Interactive colors
        static let inputBackground = Color(.systemGray6)
        static let buttonPrimary = Color("ZaloB60Color")
        static let iconDefault = Color(.secondaryLabel)
        static let iconActive = Color("ZaloB60Color")
        
        // Header colors (white text on gradient)
        static let headerText = Color.white
        static let headerTextSecondary = Color.white.opacity(0.8)
    }
}
