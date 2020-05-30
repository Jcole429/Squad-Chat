//
//  Message.swift
//  Squad-Chat
//
//  Created by Justin Cole on 5/25/20.
//  Copyright © 2020 Jcole. All rights reserved.
//

import Foundation

struct Message: Identifiable {
    let id: String
    let userUid: String
    let userEmail: String
    let userDisplayName:String
    let body: String
    
    func getDisplayName() -> String {
        return self.userDisplayName
    }
}
