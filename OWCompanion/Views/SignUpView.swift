//
//  SignUpView.swift
//  OWCompanion
//
//  Created by Furkan Türkmen on 18/07/2022.
//
import SwiftUI
import Firebase

struct SignUpView: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    
    @State var email = ""
    @State var password = ""
    @State var passwordConfirmation = ""
    
    @State var signUpProcessing = false
    @State var signUpErrorMessage = ""
    
    var body: some View {
        VStack(spacing: 15) {
            LogoView()
            SignUpCredentialFields(email: $email, password: $password, passwordConfirmation: $passwordConfirmation)
            Button(action: {
                signUpUser(userEmail: email, userPassword: password)
            }) {
                Text("Sign Up")
                    .bold()
                    .frame(width: 320, height: 12.5)
                    .padding()
                    .background(Color.buttonColors)
                    .foregroundColor(Color.buttonTextColors)
                    .cornerRadius(10)
            }
                .disabled(!signUpProcessing && !email.isEmpty && !password.isEmpty && !passwordConfirmation.isEmpty && password == passwordConfirmation ? false : true)
            if signUpProcessing {
                ProgressView()
            }
            if !signUpErrorMessage.isEmpty {
                Text("Failed creating account: \(signUpErrorMessage)")
                    .foregroundColor(.red)
            }
            Spacer()
            HStack {
                Button(action: {
                    viewRouter.currentView = .signInView
                }){
                    Text("Already have an account? Log in")
                }
            }
                .opacity(0.9)
                .foregroundColor(Color.textColors)
        }
            .padding()
            .background(Color.backgroundColors)
    }
    
    func signUpUser(userEmail: String, userPassword: String) {
        
        signUpProcessing = true
        
        Auth.auth().createUser(withEmail: userEmail, password: userPassword) { authResult, error in
            guard error == nil else {
                signUpErrorMessage = error!.localizedDescription
                signUpProcessing = false
                return
            }
            
            switch authResult {
            case .none:
                print("Could not create account.")
                signUpProcessing = false
            case .some(_):
                print("User created")
                signUpProcessing = false
                viewRouter.currentView = .homeView
            }
        }
        
    }
    
}

struct LogoView: View {
    var body: some View {
        Image("Logo")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 300, height: 150)
            .padding(.top, 70)
        Spacer()
        Text("OWCompanion")
            .font(.largeTitle)
            .fontWeight(.bold)
            .foregroundColor(Color.textColors)
        
    
    }
}

struct SignUpCredentialFields: View {
    
    @Binding var email: String
    @Binding var password: String
    @Binding var passwordConfirmation: String
    
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
            SecureField("Confirm Password", text: $passwordConfirmation)
                .padding()
                .background(.thinMaterial)
                .cornerRadius(10)
                .border(Color.red, width: passwordConfirmation != password ? 1 : 0)
                .padding(.bottom, 30)
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}

