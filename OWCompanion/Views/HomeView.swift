/*
 HomeView.swift
 OWCompanion
 
 Created by Furkan Türkmen on 18/07/2022.
 */


import SwiftUI
import Firebase

struct HomeView: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    
    @State var signOutProcessing = false
    
    var body: some View {
        NavigationView {
            FighterList()
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Image(systemName: "person.crop.circle")
                            .foregroundColor(Color.limeGreenColor)
                    }
                    ToolbarItem(placement: .navigationBarTrailing){
                        if signOutProcessing {
                            ProgressView()
                        } else {
                            Button("Sign Out") {
                                signOutUser()
                            }
                        }
                    }
                }
        }
        .background(Color.backgroundColors)
    }
    
    func signOutUser() {
        signOutProcessing = true
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
            signOutProcessing = false
        }
        withAnimation {
            viewRouter.currentView = .signInView
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
