import Foundation

struct Contact: Identifiable {
    let id = UUID()
    let name: String
    let profileImage: String
    let isOnline: Bool
    let isFavorite: Bool
}

struct FriendRequest: Identifiable {
    let id = UUID()
    let name: String
    let profileImage: String
}
