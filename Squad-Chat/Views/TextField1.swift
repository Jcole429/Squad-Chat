//
//  TextField1.swift
//  Squad-Chat
//
//  Created by Justin Cole on 5/24/20.
//  Copyright © 2020 Jcole. All rights reserved.
//

import SwiftUI

struct TextField1: View {
    var label: String
    @Binding var attribute: String


    var body: some View {
        VStack {
            HStack {
                Text(label)
                Spacer()
            }
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.white)
                .frame(height:50)
                .overlay(
                    HStack {
                        TextField("Title", text: $attribute)
                            .foregroundColor(Color.black)
                    }.padding(.horizontal)
            )
        }
    }
}


struct TextField1_Previews: PreviewProvider {
    @State static var testString = ""
    static var previews: some View {
        ZStack{
            Color("Amethyst")
            TextField1(label: "Test Label", attribute: $testString)
            .previewLayout(.sizeThatFits)
        }
    }
}
