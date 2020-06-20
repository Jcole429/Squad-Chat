//
//  LoginView.swift
//  Squad-Chat
//
//  Created by Justin Cole on 5/24/20.
//  Copyright © 2020 Jcole. All rights reserved.
//

import SwiftUI

struct LoginView: View {

    @ObservedObject var registerController = RegisterController()
    
    var body: some View {
        ZStack {
            Color(UIColor(named: "Amethyst")!)
                .edgesIgnoringSafeArea(.all)
            VStack{
                Spacer()
                Text("Login to Squad Chat")
                    .font(.subheadline)
                    .bold()
                Spacer()
                TextField1(label: "Email:",value: $registerController.email, type: Constants.normalTextField)
                TextField1(label: "Password:",value: $registerController.password, type: Constants.secureTextField)
                ActionButton(label: "Login") {
                    self.registerController.loginPressed()
                }
                Spacer()
            }.padding(.horizontal)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
