//
//  RegisterScreen.swift
//  Squad-Chat
//
//  Created by Justin Cole on 5/24/20.
//  Copyright © 2020 Jcole. All rights reserved.
//

import SwiftUI
import Firebase

struct RegisterView: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    
    @State var email = ""
    @State var password = ""
    
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
                TextField1(label: "Email",value: $email, type: Constants.normalTextField)
                TextField1(label: "Password",value: $password, type: Constants.secureTextField)
                ActionButton(label: "Create Account") {
                    self.viewRouter.setPage(pageName: Constants.Pages.homePage)
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

func createAccountPressed(email: String?, password: String?) {
    if let safeEmail = email, let safePassword = password {
        Auth.auth().createUser(withEmail: safeEmail, password: safePassword) { (authResult, error) in
            if let e = error {
                print(e)
            } else {
                
            }
        }
    }
}
