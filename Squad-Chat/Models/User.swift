//
//  User.swift
//  Squad-Chat
//
//  Created by Justin Cole on 5/25/20.
//  Copyright © 2020 Jcole. All rights reserved.
//

import Foundation
import Firebase

let db = Firestore.firestore()

struct User {
    
    let uid: String
    let email: String
    let displayName: String?
    
    init(uid: String, email: String, displayName: String?) {
        self.uid = uid
        self.email = email
        self.displayName = displayName
    }
}
