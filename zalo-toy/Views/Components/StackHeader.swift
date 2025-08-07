import SwiftUI

struct StackHeader: View {
    let title: String
    let onBackTap: () -> Void
    let trailingActions: [HeaderAction]
    
    init(
        title: String,
        onBackTap: @escaping () -> Void = {},
        trailingActions: [HeaderAction] = []
    ) {
        self.title = title
        self.onBackTap = onBackTap
        self.trailingActions = trailingActions
    }
    
    var body: some View {
        HStack {
            Button(action: onBackTap) {
                Image(systemName: "arrow.left")
                    .font(.title2)
                    .foregroundColor(.white)
                    .frame(width: 24, height: 24)
            }
            
            Text(title)
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundColor(.white)
            
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
        .zaloHeaderBackground()
    }
}

#Preview {
    VStack {
        StackHeader(
            title: "Chat Details",
            onBackTap: { print("Back tapped") },
            trailingActions: [
                HeaderAction(icon: "phone") { print("Call tapped") },
                HeaderAction(icon: "video") { print("Video tapped") }
            ]
        )
        
        StackHeader(
            title: "Settings",
            onBackTap: { print("Back tapped") }
        )
        
        Spacer()
    }
}
