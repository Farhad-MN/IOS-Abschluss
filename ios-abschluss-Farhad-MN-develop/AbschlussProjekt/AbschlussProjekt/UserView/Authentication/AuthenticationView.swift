//
//  AuthenticationView.swift
//  AbschlussProjekt
//
//  Created by Nouiaskarnian on 16.11.23.
//

import SwiftUI

struct AuthenticationView: View {
    @State private var name = ""
    @State private var email = ""
    @State private var password = ""
    @State private var isRegistering = false
    
    @EnvironmentObject var userViewModel: UserViewModel
    
    // MARK: Verwendung des UserViewModels aus der Umgebung
    
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .ignoresSafeArea()
                .blur(radius: 9)
            
            VStack {
               
                Text("Welcome to                Bike & Walk App")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                if isRegistering {
                    TextField("Name", text: $name)
                        .autocapitalization(.words)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                }
                TextField("Email", text: $email)
                    .autocapitalization(.none)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Button(action: {
                    if isRegistering {
                        userViewModel.register(email: email, password: password, name: name)
                    } else {
                        userViewModel.login(email: email, password: password)
                    }}) {
                    Text(isRegistering ? "Register" : "Login")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                Button(action: {
                    isRegistering.toggle() }) {
                        Text(isRegistering ? "Already have an account? Login" : "Don't have an account? Register")
                            .foregroundColor(Color.white) }
            }
            .padding()
        }
    }
}
#Preview {
    
    AuthenticationView()
}
