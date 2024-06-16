//
//  AuthView.swift
//  NotesApp
//
//  Created by Christopher Joseph on 6/16/24.
//

import SwiftUI
import FirebaseAuth

struct AuthView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var errorMessage: String?
    @State private var isLoggedIn: Bool = false
    
    var body: some View {
        VStack {
            Text("Authenticate to NotesApp")
                .font(.title)
                .padding()
            
            TextField("Email", text: $email)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .autocapitalization(.none)
                .autocorrectionDisabled(true)
            
            SecureField("Password", text: $password)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Text("Sign In")
                .padding()
                .onTapGesture {
                    signIn()
                }
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.black, lineWidth: 1)
                )
            
            Text("New User? Create an Account")
                .padding()
                .onTapGesture {
                    signUp()
                }
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.black, lineWidth: 1) 
                )
            
            if let errorMessage = errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
            }
            
            Spacer()
        }
        .padding()
    }
    
}

#Preview {
    AuthView()
}

