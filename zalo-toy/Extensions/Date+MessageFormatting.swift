import Foundation

extension Date {
    var messageTimeString: String {
        let formatter = DateFormatter()
        let calendar = Calendar.current
        
        if calendar.isDateInToday(self) {
            formatter.timeStyle = .short
            return formatter.string(from: self)
        } else if calendar.isDateInYesterday(self) {
            return "Yesterday"
        } else {
            formatter.dateFormat = "dd/MM"
            return formatter.string(from: self)
        }
    }
}
