import Foundation

struct ChatMessage: Identifiable {
    let id = UUID()
    let text: String
    let sender: String
    let sentDate: Date
    
    enum CodingKeys: String, CodingKey {
        case id
        case text
        case sender
        case sentDate
    }
    
    init(text: String, sender: String) {
        self.text = text
        self.sender = sender
        self.sentDate = Date()
    }
}

