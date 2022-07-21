//
//  ViewSwitcher.swift
//  OWCompanion
//
//  Created by Furkan Türkmen on 18/07/2022.
//

import SwiftUI

struct ViewSwichter: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        switch viewRouter.currentView {
        case .signUpView:
            SignUpView()
        case .signInView:
            SignInView()
        case .homeView:
            HomeView()
        }
    }
}

struct ViewSwitcher_Previews: PreviewProvider {
    static var previews: some View {
        ViewSwichter().environmentObject(ViewRouter())
    }
}
