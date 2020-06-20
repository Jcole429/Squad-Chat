
//
//  ChatSelectViewController.swift
//  Squad-Chat
//
//  Created by Justin Cole on 6/20/20.
//  Copyright © 2020 Jcole. All rights reserved.
//

import Foundation
import SwiftUI
import Firebase

class ChatSelectController: ObservableObject {
    
    @Published var chats = [Chat]()
    
    var viewRouter = SceneDelegate.viewRouter
    var session = SessionController()
    
    let db = Firestore.firestore()
    
    var chatListener: ListenerRegistration?
    
    func fetchChats() {
        chatListener = db.collection(Constants.FStore.Chats.collectionName)
            .addSnapshotListener({ (querySnapshot, error) in
                if let e = error {
                    print("Thre was an issue retrieving chats from the Firestore. \(e)")
                } else {
                    if let snapshotDocuments = querySnapshot?.documents {
                        self.chats = []
                        
                        for doc in snapshotDocuments {
                            let data = doc.data()
                            if let memberIds = data[Constants.FStore.Chats.memberIdsField] as! [String]? {
                                let newChat = Chat(id: doc.documentID, memberIds: memberIds)
                                if let safeUid = self.session.currentUser?.uid {
                                    if newChat.memberIds.contains(safeUid) {
                                        DispatchQueue.main.async {
                                            self.chats.append(newChat)
                                        }
                                    }
                                }
                            } else {
                                print("Count not parse chat data")
                            }
                        }
                    }
                }
            })
    }
    
    func createNewChat() {
        if let currentUserAuth = Auth.auth().currentUser {
            let user = User(uid: currentUserAuth.uid, email: currentUserAuth.email!, displayName: currentUserAuth.displayName)
            db.collection(Constants.FStore.Chats.collectionName).addDocument(data: [
                Constants.FStore.Chats.memberIdsField: [user.uid]
            ]) { (error) in
                if let e = error {
                    print("There was an issue saving chat to firestore, \(e)")
                } else {
                    print("Sucessfully saved chat")
                    DispatchQueue.main.async {
                        self.viewRouter.setPage(pageName: Constants.Pages.chatSelectPage)
                    }
                }
            }
        }
    }
}
