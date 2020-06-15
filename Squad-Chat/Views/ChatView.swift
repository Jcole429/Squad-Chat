//
//  HomeView.swift
//  Squad-Chat
//
//  Created by Justin Cole on 5/25/20.
//  Copyright © 2020 Jcole. All rights reserved.
//

import SwiftUI

struct ChatView: View {
    
    @ObservedObject var chatViewModel = ChatViewModel()
    
    var body: some View {
        VStack {
            ReverseScrollView {
                VStack(spacing: 0) {
                    ForEach(self.chatViewModel.messages) { message in
                        return MessageView(message: message)
                    }
                }
            }
            Rectangle()
                .fill(Color.purple)
                .frame(height:40)
                .overlay(
                    HStack {
                        TextField("Message", text: $chatViewModel.newMessageText)
                            .lineLimit(nil)
                        Button(action: {
                            print("Button pressed")
                            self.chatViewModel.sendPressed()
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
            self.chatViewModel.fetchMessages()
            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}

struct ListItem: View {
    
    let text: String
    
    var body: some View {
        Text(text)
    }
}
