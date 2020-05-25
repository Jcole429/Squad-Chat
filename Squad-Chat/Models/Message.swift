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
    let sender: String
    let body: String
}
