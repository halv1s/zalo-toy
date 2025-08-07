import SwiftUI

struct ContactsTab: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Contacts Tab")
                    .font(.title2)
                    .foregroundColor(.primary)
                
                Spacer()
            }
        }
    }
}

#Preview {
    ContactsTab()
}
