//
//  RegisterScreen.swift
//  Squad-Chat
//
//  Created by Justin Cole on 5/24/20.
//  Copyright © 2020 Jcole. All rights reserved.
//

import SwiftUI

struct RegisterView: View {

    @ObservedObject var registerViewModel = RegisterViewModel()
    
    var body: some View {
        ZStack {
            Color(UIColor(named: "Amethyst")!)
                .edgesIgnoringSafeArea(.all)
            VStack{
                Spacer()
                Text("Create a Squad Chat account")
                    .font(.subheadline)
                    .bold()
                Spacer()
                TextField1(label: "Username", value: self.$registerViewModel.username, type: Constants.normalTextField)
                TextField1(label: "Email", value: self.$registerViewModel.email, type: Constants.normalTextField)
                TextField1(label: "Password", value: self.$registerViewModel.password, type: Constants.secureTextField)
                ActionButton(label: "Create Account") {
                    self.registerViewModel.createAccountPressed()
                }
                Spacer()
            }.padding(.horizontal)
        }
    }
}

struct RegisterScreen_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
