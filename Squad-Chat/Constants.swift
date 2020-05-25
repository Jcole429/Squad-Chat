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
        static let homePage = "HomePage"
    }
    
    static let normalTextField = "Normal"
    static let secureTextField = "Secure"
    
    struct FStore {
        struct Messages {
            static let collectionName = "messages"
            static let senderField = "sender"
            static let bodyField = "body"
            static let timestamp = "timestamp"
        }
    }
}
