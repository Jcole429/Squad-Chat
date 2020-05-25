//
//  HomeView.swift
//  Squad-Chat
//
//  Created by Justin Cole on 5/25/20.
//  Copyright © 2020 Jcole. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        VStack {
            ScrollView{
                Message(messageBody: "Hello!")
                Message(messageBody: "How are you?")
                Message(messageBody: "I'm doing well.")
                Message(messageBody: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer rhoncus, nisi in egestas lobortis, eros sem sagittis justo, nec eleifend. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer rhoncus, nisi in egestas lobortis, eros sem sagittis justo, nec eleifend. Lorem ipsum dolor sit amet, consectetur adipiscing elit.")
                    
            }
            .padding(.horizontal)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct ListItem: View {
    
    let text: String
    
    var body: some View {
        Text(text)
    }
}
