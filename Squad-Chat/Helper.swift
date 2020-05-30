//
//  Helper.swift
//  Squad-Chat
//
//  Created by Justin Cole on 5/25/20.
//  Copyright © 2020 Jcole. All rights reserved.
//

import Foundation
import Firebase

//func getCurrentUser() -> User {
//    let currentAuth = Auth.auth().currentUser
//    if let safeUid = currentAuth?.uid, let safeEmail = currentAuth?.email {
//        let currentUser = User(uid: safeUid, email: safeEmail, username: getUsername(uid:safeUid))
//
//        return currentUser
//    }
//}

//func getUsername(uid: String) {
//    
//    let usersCollection = db.collection("users")
//    
//    usersCollection.whereField("uid", isEqualTo: uid)
//        .getDocuments { (QuerySnapshot, error) in
//            if let err = error {
//                print("Error getting documents: \(err)")
//            } else {
//                if let documents = QuerySnapshot?.documents {
//                    return documents[0].data()["username"]
//                }
//            }
//    }
//}
