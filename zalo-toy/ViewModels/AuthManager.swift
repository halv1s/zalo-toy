import Foundation

class AuthManager: ObservableObject {
    @Published var isLoggedIn = false
    @Published var currentUserId: String?
    
    func login(userId: String) {
        currentUserId = userId
        isLoggedIn = true
    }
    
    func logout() {
        currentUserId = nil
        isLoggedIn = false
    }
}
