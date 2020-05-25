//
//  ActionButton.swift
//  Squad-Chat
//
//  Created by Justin Cole on 5/25/20.
//  Copyright © 2020 Jcole. All rights reserved.
//

import SwiftUI

struct ActionButton: View {
    
    let label: String
    
    var body: some View {
        Button(action: {
            print("Hello")
        }) {
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.white)
                .frame(height:50)
                .padding(.horizontal)
                .overlay(Text(label)
                    .foregroundColor(.black))
        }
    }
}

struct ActionButton_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Color("Amethyst")
            ActionButton(label: "Test label")
        }
    }
}
