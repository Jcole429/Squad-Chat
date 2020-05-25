//
//  HomeView.swift
//  Squad-Chat
//
//  Created by Justin Cole on 5/25/20.
//  Copyright © 2020 Jcole. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            Text("Welcome to the homescreen")
            List {
                ListItem(text: "Group1")
                ListItem(text: "Group2")
                ListItem(text: "Group3")
            }

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
