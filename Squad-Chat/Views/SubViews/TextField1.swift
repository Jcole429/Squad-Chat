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
    @Binding var value: String
    var type: String


    var body: some View {
        VStack {
            HStack {
                Text("\(label):")
                Spacer()
            }
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.white)
                .frame(height:50)
                .overlay(
                    HStack {
                        if type == "Normal" {
                            TextField(label, text: $value)
                            .foregroundColor(Color.black)
                        } else if type == Constants.secureTextField {
                            SecureField(label, text: $value)
                            .foregroundColor(Color.black)
                        }
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
            TextField1(label: "Test Label", value: $testString, type: Constants.normalTextField)
            .previewLayout(.sizeThatFits)
        }
    }
}
