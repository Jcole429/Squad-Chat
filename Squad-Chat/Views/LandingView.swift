//
//  ContentView.swift
//  Squad-Chat
//
//  Created by Justin Cole on 5/24/20.
//  Copyright © 2020 Jcole. All rights reserved.
//

import SwiftUI

struct LandingView: View {

    @EnvironmentObject var viewRouter: ViewRouter
    
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
                    NavigationButton(label: "Register", destination: RegisterView())
                    NavigationButton(label: "Login", destination: LoginView())
                    Spacer()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LandingView()
    }
}
