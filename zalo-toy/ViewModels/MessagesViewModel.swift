import Foundation

class MessagesViewModel: ObservableObject {
    @Published var messages: [MessagePreview] = []
    
    private var currentUserId: String
    
    init(currentUserId: String = "") {
        self.currentUserId = currentUserId
        loadMockMessages()
    }
    
    func updateCurrentUser(_ userId: String) {
        self.currentUserId = userId
        loadMockMessages() // Reload with new user ID
    }
    
    func getDisplayContent(for message: MessagePreview) -> String {
        return message.displayContent(currentUserId: currentUserId)
    }
    
    func getTimeString(for message: MessagePreview) -> String {
        return message.timeString
    }
    
    func isMessageRead(_ message: MessagePreview) -> Bool {
        return message.isRead
    }
    
    private func loadMockMessages() {
        if currentUserId.isEmpty {
            messages = []
            return
        }

        messages = [
            MessagePreview(
                conversationId: "conv_1",
                conversationName: "Alice Johnson",
                conversationType: .individual,
                lastMessage: LastMessage(
                    senderId: "alice_id",
                    senderName: "Alice Johnson",
                    content: "Hey! How are you doing?",
                    messageType: .text
                ),
                timestamp: Calendar.current.date(byAdding: .minute, value: -15, to: Date()) ?? Date(),
                newMessageCount: 2,
                participants: [currentUserId, "alice_id"]
            ),
            
            MessagePreview(
                conversationId: "conv_2",
                conversationName: "Work Team",
                conversationType: .group,
                lastMessage: LastMessage(
                    senderId: "manager_id",
                    senderName: "Sarah",
                    content: "Meeting scheduled for tomorrow at 10 AM",
                    messageType: .text
                ),
                timestamp: Calendar.current.date(byAdding: .hour, value: -1, to: Date()) ?? Date(),
                newMessageCount: 1,
                participants: [currentUserId, "manager_id", "colleague_1", "colleague_2"]
            ),
            
            MessagePreview(
                conversationId: "conv_3",
                conversationName: "Bob Smith",
                conversationType: .individual,
                lastMessage: LastMessage(
                    senderId: currentUserId,
                    senderName: "You",
                    content: "Thanks for the help with the project!",
                    messageType: .text
                ),
                timestamp: Calendar.current.date(byAdding: .hour, value: -3, to: Date()) ?? Date(),
                newMessageCount: 0,
                participants: [currentUserId, "bob_id"]
            ),
            
            MessagePreview(
                conversationId: "conv_4",
                conversationName: "Family Group",
                conversationType: .group,
                lastMessage: LastMessage(
                    senderId: currentUserId,
                    senderName: "You",
                    content: "I'll be there for dinner on Sunday",
                    messageType: .text
                ),
                timestamp: Calendar.current.date(byAdding: .day, value: -1, to: Date()) ?? Date(),
                newMessageCount: 3,
                participants: [currentUserId, "mom_id", "dad_id", "sister_id"]
            ),
            
            MessagePreview(
                conversationId: "conv_5",
                conversationName: "Sarah Wilson",
                conversationType: .individual,
                lastMessage: LastMessage(
                    senderId: "sarah_id",
                    senderName: "Sarah Wilson",
                    content: "[Photo]",
                    messageType: .image
                ),
                timestamp: Calendar.current.date(byAdding: .day, value: -2, to: Date()) ?? Date(),
                newMessageCount: 0,
                participants: [currentUserId, "sarah_id"]
            ),
            
            MessagePreview(
                conversationId: "conv_6",
                conversationName: "Coffee Shop Updates",
                conversationType: .group,
                lastMessage: LastMessage(
                    senderId: "barista_id",
                    senderName: "Mike",
                    content: "[Video]",
                    messageType: .video
                ),
                timestamp: Calendar.current.date(byAdding: .day, value: -3, to: Date()) ?? Date(),
                newMessageCount: 0,
                participants: [currentUserId, "barista_id", "customer_1", "customer_2"]
            ),
            
            MessagePreview(
                conversationId: "conv_7",
                conversationName: "Mike Chen",
                conversationType: .individual,
                lastMessage: LastMessage(
                    senderId: currentUserId,
                    senderName: "You",
                    content: "[Audio]",
                    messageType: .audio
                ),
                timestamp: Calendar.current.date(byAdding: .day, value: -4, to: Date()) ?? Date(),
                newMessageCount: 0,
                participants: [currentUserId, "mike_id"]
            ),
            
            MessagePreview(
                conversationId: "conv_8",
                conversationName: "News Updates",
                conversationType: .group,
                lastMessage: LastMessage(
                    senderId: "admin_id",
                    senderName: "Admin",
                    content: "Breaking: New technology breakthrough announced",
                    messageType: .text
                ),
                timestamp: Calendar.current.date(byAdding: .day, value: -5, to: Date()) ?? Date(),
                newMessageCount: 1,
                participants: [currentUserId, "admin_id", "subscriber_1", "subscriber_2"]
            ),
            
            MessagePreview(
                conversationId: "conv_9",
                conversationName: "Emma Davis",
                conversationType: .individual,
                lastMessage: LastMessage(
                    senderId: "emma_id",
                    senderName: "Emma Davis",
                    content: "[Sticker]",
                    messageType: .sticker
                ),
                timestamp: Calendar.current.date(byAdding: .weekday, value: -1, to: Date()) ?? Date(),
                newMessageCount: 0,
                participants: [currentUserId, "emma_id"]
            )
        ]
    }
}
