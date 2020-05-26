//
//  MotherView.swift
//  Squad-Chat
//
//  Created by Justin Cole on 5/25/20.
//  Copyright © 2020 Jcole. All rights reserved.
//

import SwiftUI

struct MotherView: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        VStack{
            if viewRouter.currentPage == Constants.Pages.landingPage {
                LandingView()
            } else if viewRouter.currentPage == Constants.Pages.homePage {
                ChatView()
            }
        }
    }
}

struct MotherView_Previews: PreviewProvider {
    static var previews: some View {
        MotherView()
    }
}
