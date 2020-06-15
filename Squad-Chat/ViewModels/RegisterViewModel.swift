//
//  RegisterViewModel.swift
//  Squad-Chat
//
//  Created by Justin Cole on 6/14/20.
//  Copyright © 2020 Jcole. All rights reserved.
//

import Foundation
import Firebase
import SwiftUI

class RegisterViewModel: ObservableObject {
    
    var viewRouter = SceneDelegate.viewRouter
    
    let db = Firestore.firestore()
    
    @Published var username = "Test User"
    @Published var email = "TestUser1@email.com"
    @Published var password = "Test123"
    
    func createAccountPressed() {
        
        if username != "", email != "", password != "" {
            // Add user to authorization table
            Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
                if let e = error {
                    print(e)
                } else {
                    print("Successfully authenticated user")
                    if let currentUser = Auth.auth().currentUser {
                        let changeRequest = currentUser.createProfileChangeRequest()
                        changeRequest.displayName = self.username
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
                            ,Constants.FStore.Users.email: self.email
                            ,Constants.FStore.Users.username: self.username
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
    
    func loginPressed() {
        if email != "", password != "" {
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    print(e)
                } else {
                    self.viewRouter.setPage(pageName: Constants.Pages.homePage)
                }
            }
        }
    }
}
