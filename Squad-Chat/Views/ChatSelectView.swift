//
//  ChatSelectView.swift
//  Squad-Chat
//
//  Created by Justin Cole on 6/20/20.
//  Copyright © 2020 Jcole. All rights reserved.
//

import SwiftUI

struct ChatSelectView: View {
    
    @ObservedObject var chatSelectController = ChatSelectController()
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(UIColor(named: "Amethyst")!)
                    .edgesIgnoringSafeArea(.all)
                List {
                    ForEach(self.chatSelectController.chats) {chat in
                        
                        return NavigationLink(destination: ChatView(chat: chat)) {
                            Text(chat.chatName)
                        }
                    }
                }
            }
            .navigationBarTitle("Chats")
            .navigationBarItems(trailing:
                NavigationLink(destination: CreateChatView()) {
                    Image(systemName: "plus.square")
                        .font(.system(size:25))
                }
            )
        }
        .onAppear{
            self.chatSelectController.fetchChats()
            print("Chat View Appeared")
        }
    }
}

struct ChatSelectView_Previews: PreviewProvider {
    static var previews: some View {
        ChatSelectView()
    }
}
