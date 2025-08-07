import SwiftUI

struct ContactsTab: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                AppTabHeader(
                    trailingActions: [
                        HeaderAction(icon: "person.badge.plus") {
                            print("Add contact tapped")
                        }
                    ],
                    onSearchTap: {
                        print("Search tapped in Contacts")
                    }
                )
                
                ScrollView {
                    VStack {
                        Text("Contacts Tab")
                            .font(.title2)
                            .foregroundColor(.primary)
                        
                        Spacer()
                    }
                    .padding()
                }
            }
        }
    }
}

#Preview {
    ContactsTab()
}
