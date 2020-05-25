//
//  ViewRouter.swift
//  Squad-Chat
//
//  Created by Justin Cole on 5/25/20.
//  Copyright © 2020 Jcole. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

class ViewRouter: ObservableObject {
    
    let objectWillChange = ObservableObjectPublisher()
    
    @Published var currentPage: String = Constants.Pages.landingPage
    
    func setPage(pageName: String) {
        objectWillChange.send()
        currentPage = pageName
    }
}
