//
//  CreateChatView.swift
//  Squad-Chat
//
//  Created by Justin Cole on 6/20/20.
//  Copyright © 2020 Jcole. All rights reserved.
//

import SwiftUI

struct CreateChatView: View {
    
    @ObservedObject var chatSelectController = ChatSelectController()
    
    var body: some View {
        VStack {
            Text("Create Chats")
            TextField("Name", text: $chatSelectController.newChatName)
            Button(action: self.chatSelectController.createNewChat) {
                Text("Create first chat")
            }
        }
    }
}

struct CreateChatView_Previews: PreviewProvider {
    static var previews: some View {
        CreateChatView()
    }
}
