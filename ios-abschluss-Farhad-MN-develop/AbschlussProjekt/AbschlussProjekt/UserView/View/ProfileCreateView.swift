//
//  ProfileCreateView.swift
//  AbschlussProjekt
//
//  Created by Nouiaskarnian on 20.11.23.
//

import SwiftUI

// struct ProfileCreateView: View {
//

//    let id: String
//    @State private var firstName: String
//    @State private var lastName: String
//    @State private var email: String
//    @State private var gender: String
//    
//    @EnvironmentObject var userProfileViewModel: UserProfileViewModel
//    
//    @Binding var sheet: Sheet?
//    
//    
//    var body: some View {
//        NavigationStack {
//            VStack(spacing: 10) {
//                TextField("firstName", text: $firstName)
//                    .padding(12)
//                    .background(.gray.opacity(0.1))
//                    .cornerRadius(19)
//                
//                TextField("lastName", text: $lastName)
//                    .padding(12)
//                    .background(.gray.opacity(0.1))
//                    .cornerRadius(19)
//                
//                TextField("email", text: $email)
//                    .padding(12)
//                    .background(.gray.opacity(0.1))
//                    .cornerRadius(19)
//                
//                TextField("gender", text: $gender)
//                    .padding(12)
//                    .background(.gray.opacity(0.1))
//                    .cornerRadius(19)
//                
//                Spacer()
//                
//                PrimaryButton(title: "Create") {
//                    userProfileViewModel.createProfile(firstName: firstName, lastName: lastName, email: email, gender: gender)
//                    dismiss()
//                }
//            }
//            .padding(.horizontal, 20)
//            .navigationTitle("Create profiles")
//        }
//    }
// // MARK: - Functions
//    
//    private func createProfile() {
//        userProfileViewModel.createProfile(firstName: firstName, lastName: lastName, email: email, gender: gender)
//    }
//    
//    private func dismiss() {
//        sheet = nil
//    }
//    
// }
//
// struct ProfileCreateView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileCreateView(sheet: .constant(nil)).environmentObject(UserProfileViewModel())
//    }
// }
