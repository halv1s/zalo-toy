import Foundation

enum MessageType {
    case text
    case image
    case video
    case audio
    case file
    case sticker
    case location
    
    var displayText: String {
        switch self {
        case .text: return ""
        case .image: return "[Photo]"
        case .video: return "[Video]"
        case .audio: return "[Audio]"
        case .file: return "[File]"
        case .sticker: return "[Sticker]"
        case .location: return "[Location]"
        }
    }
}
