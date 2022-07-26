//
//  SignInView.swift
//  OWCompanion
//
//  Created by Furkan Türkmen on 18/07/2022.
//

import SwiftUI
import Firebase

struct SignInView: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    
    @State var email = ""
    @State var password = ""
    
    @State var signInProcessing = false
    @State var signInErrorMessage = ""
    
    var body: some View {
        VStack(spacing: 15) {
            LogoView()
            Spacer()
            SignInCredentialFields(email: $email, password: $password)
            Button(action: {
                signInUser(userEmail: email, userPassword: password)
            }) {
                Text("Log In")
                    .bold()
                    .frame(width: 320, height: 12.5)
                    .padding()
                    .background(Color.buttonColors)
                    .foregroundColor(Color.buttonTextColors)
                    .cornerRadius(10)
            }
                .disabled(!signInProcessing && !email.isEmpty && !password.isEmpty ? false : true)
            if signInProcessing {
                ProgressView()
            }
            if !signInErrorMessage.isEmpty {
                Text("Failed creating account: \(signInErrorMessage)")
                    .foregroundColor(.red)
            }
            Spacer()
            HStack {
                Button(action: {
                    viewRouter.currentView = .signUpView
                }){
                    Text("Don't have an account? Sign up")
                }
            }
                .opacity(0.9)
                .foregroundColor(Color.textColors)
        }
            .padding()
            .background(Color.backgroundColors)
    }
    
    func signInUser(userEmail: String, userPassword: String) {
        
        signInProcessing = true
        
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            
            guard error == nil else {
                signInProcessing = false
                signInErrorMessage = error!.localizedDescription
                return
            }
            switch authResult {
            case .none:
                print("Could not sign in user.")
                signInProcessing = false
            case .some(_):
                print("User signed in")
                signInProcessing = false
                withAnimation {
                    viewRouter.currentView = .homeView
                }
            }
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}

struct SignInCredentialFields: View {
    
    @Binding var email: String
    @Binding var password: String
    
    var body: some View {
        Group {
            TextField("Email", text: $email)
                .padding()
                .background(.thinMaterial)
                .cornerRadius(10)
                .textInputAutocapitalization(.never)
            SecureField("Password", text: $password)
                .padding()
                .background(.thinMaterial)
                .cornerRadius(10)
                .padding(.bottom, 30)
        }
    }
}
