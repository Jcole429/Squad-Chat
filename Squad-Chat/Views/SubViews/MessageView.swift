//
//  Message.swift
//  Squad-Chat
//
//  Created by Justin Cole on 5/25/20.
//  Copyright © 2020 Jcole. All rights reserved.
//

import SwiftUI

struct MessageView: View {
    
    var message: Message
    
    var body: some View {
        
        VStack {
            HStack {
                Spacer().frame(width:40)
                Text(message.sender)
                Spacer()
            }
            HStack{
                Circle().foregroundColor(.blue).frame(width:30, height:30)
                Capsule().overlay(Text(message.body)
                    .foregroundColor(.red)
                    .lineLimit(nil).multilineTextAlignment(.leading))
                Spacer()
                Circle().foregroundColor(.blue).frame(width:30, height:30)
            }
        }
    }
}

struct Message_Previews: PreviewProvider {
    static var previews: some View {
        MessageView(message: Message(id: "1", sender: "Test@email.com",body:"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer rhoncus, nisi in egestas lobortis, eros sem sagittis justo, nec eleifend. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer rhoncus, nisi in egestas lobortis, eros sem sagittis justo, nec eleifend. Lorem ipsum dolor sit amet, consectetur adipiscing elit.")).previewLayout(.sizeThatFits)
    }
}
