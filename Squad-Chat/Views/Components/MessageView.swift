//
//  Message.swift
//  Squad-Chat
//
//  Created by Justin Cole on 5/25/20.
//  Copyright © 2020 Jcole. All rights reserved.
//

import SwiftUI
import Firebase

struct MessageView: View {
    
    let db = Firestore.firestore()
    
    var message: Message
    
    var isCurrentUser = false
    
    var body: some View {
        
        VStack {
            HStack {
                Text(message.getDisplayName())
                Spacer()
            }
            Text(message.body)
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity)
                .padding(10)
                .foregroundColor(isCurrentUser ? Color.white : Color.black)
                .background(isCurrentUser ? Color.blue : Color(UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1.0)))
                .cornerRadius(10)
        }
    }
}

struct Message_Previews: PreviewProvider {
    static var previews: some View {
        MessageView(message: Message(id: "1", chatId: "1", userUid: "1", userEmail: "testuser@email.com", userDisplayName: "TestUser", body:"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer rhoncus, nisi in egestas lobortis, eros sem sagittis justo, nec eleifend. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer rhoncus, nisi in egestas lobortis, eros sem sagittis justo, nec eleifend. Lorem ipsum dolor sit amet, consectetur adipiscing elit.")).previewLayout(.sizeThatFits)
    }
}
