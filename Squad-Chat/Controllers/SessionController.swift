//
//  Session.swift
//  Squad-Chat
//
//  Created by Justin Cole on 5/26/20.
//  Copyright © 2020 Jcole. All rights reserved.
//

import Foundation
import Firebase

class SessionController {
    
    @Published var currentUser: User?
    
    init() {
        getUserAuth()
    }
    
    func getUserAuth() {
        let currentAuth = Auth.auth().currentUser
        if let safeUid = currentAuth?.uid, let safeEmail = currentAuth?.email {
            let currentUser = User(uid: safeUid, email: safeEmail, displayName: currentAuth?.displayName)
             
            self.currentUser = currentUser
        }
    }
    
//    func getUser(uid: String) {
//
//        let usersCollection = db.collection("users")
//
//        usersCollection.whereField("uid", isEqualTo: uid)
//            .getDocuments { (QuerySnapshot, error) in
//                if let err = error {
//                    print("Error getting documents: \(err)")
//                } else {
//                    if let documents = QuerySnapshot?.documents {
//                        if let safeUid = self.currentUser?.uid, let safeEmail = self.currentUser?.email {
//                            self.currentUser = User(uid: safeUid, email: safeEmail, username: documents[0].data()["username"] as! String)
//                        }
//                    }
//                }
//        }
//    }
}


