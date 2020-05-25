//
//  NavigationButton.swift
//  Squad-Chat
//
//  Created by Justin Cole on 5/24/20.
//  Copyright © 2020 Jcole. All rights reserved.
//

import SwiftUI

struct NavigationButton: View {
    
    let label: String
    
    var body: some View {
        NavigationLink(destination: RegisterScreen()) {
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.white)
                .frame(height:50)
                .padding(.horizontal)
                .overlay(Text(label)
                    .foregroundColor(.black))
        }
    }
}

struct NavigationButton_Previews: PreviewProvider {
    static var previews: some View {
        NavigationButton(label: "Test Label")
    }
}
