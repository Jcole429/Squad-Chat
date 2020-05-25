//
//  LoginView.swift
//  Squad-Chat
//
//  Created by Justin Cole on 5/24/20.
//  Copyright © 2020 Jcole. All rights reserved.
//

import SwiftUI
import Firebase

struct LoginView: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    
    @State var email = "TestUser1@email.com"
    @State var password = "Test123"
    
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
                TextField1(label: "Email:",value: $email, type: Constants.normalTextField)
                TextField1(label: "Password:",value: $password, type: Constants.secureTextField)
                ActionButton(label: "Login") {
                    self.loginPressed(email: self.email, password: self.password)
                }
                Spacer()
            }.padding(.horizontal)
        }
    }
    
    func loginPressed(email: String?, password: String?) {
        if let safeEmail = email, let safePassword = password {
            Auth.auth().signIn(withEmail: safeEmail, password: safePassword) { authResult, error in
                if let e = error {
                    print(e)
                } else {
                    self.viewRouter.setPage(pageName: Constants.Pages.homePage)
                }
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
