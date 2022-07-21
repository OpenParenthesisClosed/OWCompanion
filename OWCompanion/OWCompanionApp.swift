/*
OWCompanionApp.swift
OWCompanion

Created by Furkan Türkmen on 20/07/2022.
*/


import SwiftUI
import Firebase

@main
struct OWCompanionApp: App {
    
    @StateObject var viewRouter = ViewRouter()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ViewSwichter().environmentObject(viewRouter)
        }
    }
}
