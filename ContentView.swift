import SwiftUI

struct ContentView: View {
    @State private var messageText: String = ""
    @State private var messages: [String] = []
    
    var body: some View {
        VStack {
            List(messages, id: \.self) { message in
                Text(message)
            }
            HStack {
                TextField("Message", text: $messageText)
                Button(action: sendMessage) {
                    Text("Send")
                }
            }
            .padding()
        }
    }
    
    private func sendMessage() {
        messages.append(messageText)
        messageText = ""
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

