//
//  HomeView.swift
//  Squad-Chat
//
//  Created by Justin Cole on 5/25/20.
//  Copyright © 2020 Jcole. All rights reserved.
//

import SwiftUI
import Firebase

struct ChatView: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    
    @State var messageBody = ""
    
    let db = Firestore.firestore()
    
    var listener: ListenerRegistration?
    
    @ObservedObject var messageController = MessageController()
    
    var body: some View {
        VStack {
            ReverseScrollView {
                VStack(spacing: 0) {
                    ForEach(self.messageController.messages) { message in
                        return MessageView(message: message)
                    }
                }
            }
            Rectangle()
                .fill(Color.purple)
                .frame(height:40)
                .overlay(
                    HStack {
                        TextField("Message", text: $messageBody)
                            .lineLimit(nil)
                        Button(action: {
                            print("Button pressed")
                            self.sendPressed()
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
            self.messageController.fetchMessages()
            
        }
    }
    
    func sendPressed() {
        if messageBody != "" {
            if let messageSender = Auth.auth().currentUser?.email {
                
                db.collection(Constants.FStore.Messages.collectionName).addDocument(data: [
                    Constants.FStore.Messages.senderField: messageSender
                    ,Constants.FStore.Messages.bodyField: messageBody
                    ,Constants.FStore.Messages.timestamp: Date()
                ]) { (error) in
                    if let e = error {
                        print("There was an issue saving message to firestore, \(e)")
                    } else {
                        print("Sucessfully saved message")
                        DispatchQueue.main.async {
                            self.messageBody = ""
                        }
                    }
                }
            }
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
