//
//  MessageController.swift
//  Squad-Chat
//
//  Created by Justin Cole on 5/25/20.
//  Copyright © 2020 Jcole. All rights reserved.
//

import Foundation
import Firebase

class ChatController: ObservableObject {
    
    @Published var messages = [Message]()
    @Published var newMessageText = ""
    
    let db = Firestore.firestore()
    var listener: ListenerRegistration?
    
    func fetchMessages() {
        listener = db.collection(Constants.FStore.Messages.collectionName)
            .order(by: Constants.FStore.Messages.timestamp)
            .addSnapshotListener { (querySnapshot, error) in
                if let e = error {
                    print("Thre was an issue retrieving data from the Firestore. \(e)")
                } else {
                    if let snapshotDocuments = querySnapshot?.documents {
                        
                        self.messages = []
                        
                        for doc in snapshotDocuments {
                            let data = doc.data()
                            if let userUid = data[Constants.FStore.Messages.userUidField] as! String?
                                ,let userEmail = data[Constants.FStore.Messages.userEmailField] as! String?
                                ,let userDisplayName = data[Constants.FStore.Messages.userDisplayNameField] as! String?
                                ,let messageBody = data[Constants.FStore.Messages.bodyField] as? String {
                                let newMessage = Message(id: doc.documentID, userUid: userUid, userEmail: userEmail, userDisplayName: userDisplayName, body: messageBody)
                                
                                DispatchQueue.main.async {
                                    self.messages.append(newMessage)
                                }
                            } else {
                                print("Could not parse user data")
                            }
                        }
                    }
                }
        }
    }
    
    func sendPressed() {
        if newMessageText != "" {
            if let currentUserAuth = Auth.auth().currentUser {
                
                let user = User(uid: currentUserAuth.uid, email: currentUserAuth.email!, displayName: currentUserAuth.displayName)
                
                
                db.collection(Constants.FStore.Messages.collectionName).addDocument(data: [
                    Constants.FStore.Messages.userUidField: user.uid
                    ,Constants.FStore.Messages.userEmailField: user.email
                    ,Constants.FStore.Messages.userDisplayNameField: user.displayName ?? nil!
                    ,Constants.FStore.Messages.bodyField: newMessageText
                    ,Constants.FStore.Messages.timestamp: Date()
                ]) { (error) in
                    if let e = error {
                        print("There was an issue saving message to firestore, \(e)")
                    } else {
                        print("Sucessfully saved message")
                        DispatchQueue.main.async {
                            self.newMessageText = ""
                        }
                    }
                }
            }
        }
    }
}
