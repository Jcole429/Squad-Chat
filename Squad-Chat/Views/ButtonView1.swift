//
//  ButtonView1.swift
//  Squad-Chat
//
//  Created by Justin Cole on 5/24/20.
//  Copyright © 2020 Jcole. All rights reserved.
//

import SwiftUI

struct ButtonView1: View {
    let text: String
    
    var body: some View {
        NavigationLink(destination: RegisterScreen()) {
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.white)
                .frame(height:50)
                .padding(.horizontal)
                .overlay(Text(text)
                    .foregroundColor(.black))
        }
    }
}
struct ButtonView1_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView1(text: "Testing")
    }
}
