import SwiftUI

struct MessagesTab: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Messages Tab")
                    .font(.title2)
                    .foregroundColor(.primary)
                
                Spacer()
            }
        }
    }
}

#Preview {
    MessagesTab()
}
