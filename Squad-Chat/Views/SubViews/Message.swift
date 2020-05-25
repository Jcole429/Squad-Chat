//
//  Message.swift
//  Squad-Chat
//
//  Created by Justin Cole on 5/25/20.
//  Copyright © 2020 Jcole. All rights reserved.
//

import SwiftUI

struct Message: View {
    
    var messageBody: String
    
    var body: some View {
        
        HStack{
            Circle().foregroundColor(.blue).frame(width:30, height:30)
            Text(messageBody)
            Circle().foregroundColor(.blue).frame(width:30, height:30)
        }
    }
}

struct Message_Previews: PreviewProvider {
    static var previews: some View {
        Message(messageBody: "Hello world!").previewLayout(.sizeThatFits)
    }
}
