//
//  ContentView.swift
//  Squad-Chat
//
//  Created by Justin Cole on 5/24/20.
//  Copyright © 2020 Jcole. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var registerScreen = RegisterScreen()
    
    var body: some View {
        NavigationView{
            ZStack {
                Color(UIColor(named: "Amethyst")!)
                    .edgesIgnoringSafeArea(.all)
                VStack{
                    Spacer()
                    Text("Squad Chat")
                        .font(.title)
                        .bold()
                    Spacer()
                    NavigationLink(destination: RegisterScreen()) {
                        RoundedRectangle(cornerRadius: 25)
                            .fill(Color.white)
                            .frame(height:50)
                            .padding(.horizontal)
                            .overlay(Text("Register")
                                .foregroundColor(.black))
                    }
                    NavigationLink(destination: LoginView()) {
                        RoundedRectangle(cornerRadius: 25)
                            .fill(Color.white)
                            .frame(height:50)
                            .padding(.horizontal)
                            .overlay(Text("Login")
                                .foregroundColor(.black))
                    }
                    //                    ButtonView1(text: "Login")
                    Spacer()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
