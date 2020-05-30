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
    
    let db = Firestore.firestore()
    
    @State var username = "Test User"
    @State var email = "TestUser1@email.com"
    @State var password = "Test123"
    
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
                TextField1(label: "Username", value: $username, type: Constants.normalTextField)
                TextField1(label: "Email", value: $email, type: Constants.normalTextField)
                TextField1(label: "Password", value: $password, type: Constants.secureTextField)
                ActionButton(label: "Create Account") {
                    self.createAccountPressed(username: self.username, email: self.email, password: self.password)
                }
                Spacer()
            }.padding(.horizontal)
        }
    }
    
    func createAccountPressed(username: String?, email: String?, password: String?) {
        
        if let safeUsername = username, let safeEmail = email, let safePassword = password {
            // Add user to authorization table
            Auth.auth().createUser(withEmail: safeEmail, password: safePassword) { (authResult, error) in
                if let e = error {
                    print(e)
                } else {
                    print("Successfully authenticated user")
                    if let currentUser = Auth.auth().currentUser {
                        let changeRequest = currentUser.createProfileChangeRequest()
                        changeRequest.displayName = username
                        changeRequest.commitChanges { (error) in
                            if let e = error {
                                print("There was an issue updating user's username, \(e)")
                            }
                            else {
                                print("Sucessfully updated username")
                                
                            }
                        }
                        self.db.collection(Constants.FStore.Users.collectionName).addDocument(data: [
                            Constants.FStore.Users.uid: currentUser.uid
                            ,Constants.FStore.Users.email: safeEmail
                            ,Constants.FStore.Users.username: safeUsername
                        ]) { (error) in
                            if let e = error {
                                print("There was an issue saving message to firestore, \(e)")
                            } else {
                                print("Successfully saved user")
                                self.viewRouter.setPage(pageName: Constants.Pages.homePage)
                            }
                        }
                    }
                    
                }
            }
        }
    }
    
}

struct RegisterScreen_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
