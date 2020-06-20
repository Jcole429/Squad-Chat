//
//  HomeView.swift
//  Squad-Chat
//
//  Created by Justin Cole on 5/25/20.
//  Copyright © 2020 Jcole. All rights reserved.
//

import SwiftUI

struct ChatView: View {
    
    var chat: Chat
    
    @ObservedObject var chatController = ChatController()

    var body: some View {
        VStack {
            ReverseScrollView {
                VStack(spacing: 0) {
                    ForEach(self.chatController.messages) { message in
                        return MessageView(message: message)
                    }
                }
            }
            Rectangle()
                .fill(Color.purple)
                .frame(height:40)
                .overlay(
                    HStack {
                        TextField("Message", text: $chatController.newMessageText)
                            .lineLimit(nil)
                        Button(action: {
                            print("Send chat button pressed")
                            self.chatController.sendPressed()
                        }, label: {
                            Image(systemName: "paperplane")
                                .frame(width:40, height: 40)
                                .foregroundColor(Color.white)
                        })
                    }
            )
        }
        .padding(.horizontal)
        .onAppear() {
            print("\(self.chat.chatName) appeared")
            self.chatController.chat = self.chat
            self.chatController.fetchMessages()
        }
        .onDisappear() {
            print("\(self.chat.chatName) dissapeared")
            self.chatController.chatClosed()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(chat: Chat(id: "1", chatName: "Chat 1", memberIds: ["1"]))
    }
}
