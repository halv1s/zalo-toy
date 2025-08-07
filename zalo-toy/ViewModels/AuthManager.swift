import Foundation

class AuthManager: ObservableObject {
    @Published var isLoggedIn = false
    @Published var currentUserId: String?
    
    private let userDefaults = UserDefaults.standard
    private let userIdKey = "current_user_id"
    private let isLoggedInKey = "is_logged_in"
    
    init() {
        loadAuthState()
    }
    
    func login(userId: String) {
        currentUserId = userId
        isLoggedIn = true
        saveAuthState()
    }
    
    func logout() {
        currentUserId = nil
        isLoggedIn = false
        clearAuthState()
    }
    
    private func loadAuthState() {
        let savedUserId = userDefaults.string(forKey: userIdKey)
        let savedIsLoggedIn = userDefaults.bool(forKey: isLoggedInKey)
        
        if savedIsLoggedIn, let userId = savedUserId, !userId.isEmpty {
            currentUserId = userId
            isLoggedIn = true
        } else {
            currentUserId = nil
            isLoggedIn = false
        }
    }
    
    private func saveAuthState() {
        userDefaults.set(currentUserId, forKey: userIdKey)
        userDefaults.set(isLoggedIn, forKey: isLoggedInKey)
    }
    
    private func clearAuthState() {
        userDefaults.removeObject(forKey: userIdKey)
        userDefaults.removeObject(forKey: isLoggedInKey)
    }
}
