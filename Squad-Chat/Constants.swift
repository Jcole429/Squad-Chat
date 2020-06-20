//
//  Constants.swift
//  Squad-Chat
//
//  Created by Justin Cole on 5/24/20.
//  Copyright © 2020 Jcole. All rights reserved.
//

import Foundation

struct Constants {
    
    struct Pages{
        static let landingPage = "LandingPage"
        static let chatSelectPage = "ChatSelectPage"
    }
    
    static let normalTextField = "Normal"
    static let secureTextField = "Secure"
    
    struct FStore {
        struct Messages {
            static let collectionName = "messages"
            static let chatIdField = "chatId"
            static let userUidField = "userUid"
            static let userEmailField = "userEmail"
            static let userDisplayNameField = "userDisplayName"
            static let bodyField = "body"
            static let timestamp = "timestamp"
        }
        
        struct Chats {
            static let collectionName = "chats"
            static let memberIdsField = "memberIds"
        }
        
        struct Users {
            static let collectionName = "users"
            static let uid = "uid"
            static let email = "email"
            static let username = "username"
        }
    }
}
