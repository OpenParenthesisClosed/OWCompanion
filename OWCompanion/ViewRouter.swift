/*
ViewRouter.swift
OWCompanion

Created by Furkan Türkmen on 18/07/2022.
*/


import SwiftUI

class ViewRouter: ObservableObject {
    
    @Published var currentView: WhichView = .signInView
    
}

enum WhichView {
    case signUpView
    case signInView
    case homeView
}
