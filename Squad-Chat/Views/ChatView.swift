//
//  HomeView.swift
//  Squad-Chat
//
//  Created by Justin Cole on 5/25/20.
//  Copyright © 2020 Jcole. All rights reserved.
//

import SwiftUI

struct ChatView: View {
    
    var chatId: String
    
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
        .onAppear{
            self.chatController.chatId = self.chatId
            self.chatController.fetchMessages()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(chatId:"1")
    }
}
