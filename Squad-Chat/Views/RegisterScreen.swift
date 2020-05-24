//
//  RegisterScreen.swift
//  Squad-Chat
//
//  Created by Justin Cole on 5/24/20.
//  Copyright © 2020 Jcole. All rights reserved.
//

import SwiftUI

struct RegisterScreen: View {
    
    @State var username = ""
    @State var password = ""
    
    var body: some View {
        ZStack {
            Color(UIColor(named: "Amethyst")!)
                .edgesIgnoringSafeArea(.all)
            VStack{
                Spacer()
                Text("Create an account")
                    .font(.subheadline)
                    .bold()
                Spacer()
                TextField1(label: "Username:",attribute: $username)
//                TextField(attribute: $password)
                Spacer()
            }.padding(.horizontal)
        }
    }
}

struct RegisterScreen_Previews: PreviewProvider {
    static var previews: some View {
        RegisterScreen()
    }
}
