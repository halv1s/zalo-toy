import SwiftUI

struct AppTabHeader: View {
    let trailingActions: [HeaderAction]
    let onSearchTap: () -> Void
    
    init(
        trailingActions: [HeaderAction] = [],
        onSearchTap: @escaping () -> Void = {}
    ) {
        self.trailingActions = trailingActions
        self.onSearchTap = onSearchTap
    }
    
    var body: some View {
        HStack {
            Button(action: onSearchTap) {
                Image(systemName: "magnifyingglass")
                    .font(.title2)
                    .foregroundColor(.white)
                    .frame(width: AppConstants.IconSize.large, height: AppConstants.IconSize.large)
            }
            
            Text("Search")
                .font(.title3)
                .foregroundColor(.white.opacity(0.8))
            
            Spacer()
            
            HStack(spacing: AppConstants.Spacing.extraLarge) {
                ForEach(0..<trailingActions.count, id: \.self) { index in
                    Button(action: trailingActions[index].action) {
                        Image(systemName: trailingActions[index].icon)
                            .font(.title2)
                            .foregroundColor(.white)
                            .frame(width: AppConstants.IconSize.large, height: AppConstants.IconSize.large)
                    }
                }
            }
        }
        .zaloHeaderBackground()
    }
}

#Preview {
    VStack {
        AppTabHeader(
            trailingActions: [
                HeaderAction(icon: "qrcode.viewfinder") { print("QR tapped") },
                HeaderAction(icon: "plus") { print("Plus tapped") }
            ],
            onSearchTap: { print("Search tapped") }
        )
        
        Spacer()
    }
}
