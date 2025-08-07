import Foundation

class ContactsViewModel: ObservableObject {
    @Published var contacts: [Contact] = []
    @Published var friendRequests: [FriendRequest] = []
    @Published var closeFriends: [Contact] = []
    @Published var onlineContacts: [Contact] = []
    
    init() {
        loadMockData()
    }
    
    var allContactsCount: Int {
        contacts.count
    }
    
    var onlineContactsCount: Int {
        onlineContacts.count
    }
    
    var friendRequestsCount: Int {
        friendRequests.count
    }
    
    func getFilteredContacts(filter: Int) -> [Contact] {
        switch filter {
        case 1: // Recently online
            return onlineContacts
        default: // All
            return contacts
        }
    }
    
    func getGroupedContacts(filter: Int) -> [String: [Contact]] {
        let filteredContacts = getFilteredContacts(filter: filter)
        return Dictionary(grouping: filteredContacts) { contact in
            String(contact.name.prefix(1).uppercased())
        }
    }
    
    private func loadMockData() {
        contacts = [
            Contact(name: "Alice Johnson", profileImage: "person.circle.fill", isOnline: true, isFavorite: true),
            Contact(name: "Andrew Thompson", profileImage: "person.circle.fill", isOnline: false, isFavorite: false),
            Contact(name: "Bob Smith", profileImage: "person.circle.fill", isOnline: false, isFavorite: false),
            Contact(name: "Benjamin Clarke", profileImage: "person.circle.fill", isOnline: true, isFavorite: false),
            Contact(name: "Charlie Brown", profileImage: "person.circle.fill", isOnline: true, isFavorite: false),
            Contact(name: "Catherine Williams", profileImage: "person.circle.fill", isOnline: false, isFavorite: false),
            Contact(name: "Diana Prince", profileImage: "person.circle.fill", isOnline: false, isFavorite: true),
            Contact(name: "Edward Miller", profileImage: "person.circle.fill", isOnline: true, isFavorite: false),
            Contact(name: "Fiona Davis", profileImage: "person.circle.fill", isOnline: false, isFavorite: false),
            Contact(name: "George Wilson", profileImage: "person.circle.fill", isOnline: true, isFavorite: false),
            Contact(name: "Hannah Lee", profileImage: "person.circle.fill", isOnline: false, isFavorite: false),
            Contact(name: "Ian Taylor", profileImage: "person.circle.fill", isOnline: true, isFavorite: false),
            Contact(name: "Julia Roberts", profileImage: "person.circle.fill", isOnline: false, isFavorite: false)
        ]

        contacts.sort { $0.name < $1.name }
        
        friendRequests = [
            FriendRequest(name: "Kevin Anderson", profileImage: "person.circle.fill"),
            FriendRequest(name: "Linda Garcia", profileImage: "person.circle.fill")
        ]
        
        closeFriends = contacts.filter { $0.isFavorite }

        onlineContacts = contacts.filter { $0.isOnline }
    }
}
