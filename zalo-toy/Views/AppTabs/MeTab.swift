import SwiftUI

struct MeTab: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Me Tab")
                    .font(.title2)
                    .foregroundColor(.primary)
                
                Spacer()
            }
        }
    }
}

#Preview {
    MeTab()
}
