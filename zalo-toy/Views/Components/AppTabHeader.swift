import SwiftUI

struct HeaderAction {
    let icon: String
    let action: () -> Void
}

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
                    .frame(width: 24, height: 24)
            }
            
            Text("Search")
                .font(.title3)
                .foregroundColor(.white.opacity(0.8))
            
            Spacer()
            
            HStack(spacing: 16) {
                ForEach(0..<trailingActions.count, id: \.self) { index in
                    Button(action: trailingActions[index].action) {
                        Image(systemName: trailingActions[index].icon)
                            .font(.title2)
                            .foregroundColor(.white)
                            .frame(width: 24, height: 24)
                    }
                }
            }
        }
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
