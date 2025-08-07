import Foundation

struct MessagePreview: Identifiable {
    let id = UUID()
    let conversationId: String
    let conversationName: String 
    let conversationType: ConversationType
    let lastMessage: LastMessage
    let timestamp: Date
    let newMessageCount: Int
    let participants: [String]
}
