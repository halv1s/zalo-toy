import Foundation

extension MessagePreview {
    func displayContent(currentUserId: String) -> String {
        switch conversationType {
        case .individual:
            if lastMessage.senderId == currentUserId {
                return "You: \(lastMessage.content)"
            } else {
                return lastMessage.content
            }
            
        case .group:
            if lastMessage.senderId == currentUserId {
                return "You: \(lastMessage.content)"
            } else {
                return "\(lastMessage.senderName): \(lastMessage.content)"
            }
        }
    }
    
    var timeString: String {
        return timestamp.messageTimeString
    }
    
    var isRead: Bool {
        return newMessageCount == 0
    }
}
