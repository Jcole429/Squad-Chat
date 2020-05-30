//
//  MessageController.swift
//  Squad-Chat
//
//  Created by Justin Cole on 5/25/20.
//  Copyright © 2020 Jcole. All rights reserved.
//

import Foundation
import Firebase


class MessageController: ObservableObject {
    
    @Published var messages = [Message]()
    
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
}
