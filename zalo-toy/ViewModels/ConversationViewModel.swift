import Foundation

class ConversationViewModel: ObservableObject {
    @Published var messages: [ConversationMessage] = []
    @Published var isLoading = true
    @Published var conversationName = "Conversation"
    @Published var isOnline = false
    
    private let conversationId: String
    private let currentUserId: String
    
    init(conversationId: String, currentUserId: String = "current_user") {
        self.conversationId = conversationId
        self.currentUserId = currentUserId
    }
    
    func loadMessages() {
        isLoading = true
        
        // Simulate network delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.loadMockMessages()
            self.isLoading = false
        }
    }
    
    func sendMessage(content: String) {
        guard !content.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else { return }
        
        let newMessage = ConversationMessage(
            id: UUID().uuidString,
            content: content,
            timestamp: Date(),
            isFromCurrentUser: true,
            senderId: currentUserId,
            senderName: "You"
        )
        
        messages.append(newMessage)
        
        // Simulate auto reply after a delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.simulateReply()
        }
    }
    
    func formatMessageTime(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
    
    private func loadMockMessages() {
        // Load conversation info based on conversationId
        loadConversationInfo()
        
        let now = Date()
        
        messages = [
            ConversationMessage(
                id: "1",
                content: "Hey there! How are you doing?",
                timestamp: now.addingTimeInterval(-7200), // 2 hours ago
                isFromCurrentUser: false,
                senderId: "other_user",
                senderName: conversationName
            ),
            ConversationMessage(
                id: "2",
                content: "I'm doing great! Just finished work. How about you?",
                timestamp: now.addingTimeInterval(-7140), // 1 hour 59 minutes ago
                isFromCurrentUser: true,
                senderId: currentUserId,
                senderName: "You"
            ),
            ConversationMessage(
                id: "3",
                content: "That's awesome! I'm having a pretty good day too.",
                timestamp: now.addingTimeInterval(-5400), // 1.5 hours ago (30+ min gap from previous)
                isFromCurrentUser: false,
                senderId: "other_user",
                senderName: conversationName
            ),
            ConversationMessage(
                id: "4",
                content: "Want to grab coffee sometime this week?",
                timestamp: now.addingTimeInterval(-5340), // 1 hour 29 minutes ago
                isFromCurrentUser: false,
                senderId: "other_user",
                senderName: conversationName
            ),
            ConversationMessage(
                id: "5",
                content: "Sure! I'd love to. How about Wednesday afternoon?",
                timestamp: now.addingTimeInterval(-3600), // 1 hour ago (30+ min gap from previous)
                isFromCurrentUser: true,
                senderId: currentUserId,
                senderName: "You"
            ),
            ConversationMessage(
                id: "6",
                content: "Perfect! See you then 😊",
                timestamp: now.addingTimeInterval(-3540), // 59 minutes ago
                isFromCurrentUser: false,
                senderId: "other_user",
                senderName: conversationName
            ),
            ConversationMessage(
                id: "7",
                content: "Looking forward to it!",
                timestamp: now.addingTimeInterval(-1800), // 30 minutes ago (30+ min gap from previous)
                isFromCurrentUser: true,
                senderId: currentUserId,
                senderName: "You"
            )
        ]
    }
    
    private func loadConversationInfo() {
        // Simulate loading conversation metadata
        switch conversationId {
        case "conv_1":
            conversationName = "Alice Johnson"
            isOnline = true
        case "conv_2":
            conversationName = "Work Team"
            isOnline = false
        case "conv_3":
            conversationName = "Bob Smith"
            isOnline = true
        case "conv_4":
            conversationName = "Family Group"
            isOnline = false
        default:
            conversationName = "Unknown Contact"
            isOnline = false
        }
    }
    
    private func simulateReply() {
        let replies = [
            "Thanks for your message!",
            "That sounds great!",
            "I'll get back to you soon.",
            "Absolutely!",
            "Let me think about it."
        ]
        
        let randomReply = replies.randomElement() ?? "Thanks!"
        
        let replyMessage = ConversationMessage(
            id: UUID().uuidString,
            content: randomReply,
            timestamp: Date(),
            isFromCurrentUser: false,
            senderId: "other_user",
            senderName: conversationName
        )
        
        messages.append(replyMessage)
    }
}
