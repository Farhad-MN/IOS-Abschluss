//
//  ProfileEditView.swift
//  AbschlussProjekt
//
//  Created by Nouiaskarnian on 20.11.23.
//

import SwiftUI

// struct ProfileEditView: View {
//
//    init(profile: FireProfile) {
//        self.id = profile.id ?? ""
//        self._firstName = State(initialValue: profile.firstName)
//        self._lastName = State(initialValue: profile.lastName)
//        self._email = State(initialValue: profile.email)
//        self._gender = State(initialValue: profile.gender)
//        
//    }
//    
//    var body: some View {
//        NavigationStack {
//            VStack(spacing:12) {
//                TextField(firstName, text: $firstName)
//                    .padding(12)
//                    .background(.gray.opacity(0.1))
//                    .cornerRadius(10)
//                
//                TextField(lastName, text: $lastName)
//                    .padding(12)
//                    .background(.gray.opacity(0.1))
//                    .cornerRadius(10)
//                
//                TextField(email, text: $email)
//                    .padding(12)
//                    .background(.gray.opacity(0.1))
//                    .cornerRadius(10)
//                
//                TextField(gender, text: $gender)
//                    .padding(12)
//                    .background(.gray.opacity(0.1))
//                    .cornerRadius(10)
//                
//                Spacer()
//                
//                PrimaryButton(title: "Update") {
//                    userProfileViewModel.updateProfil(with: id, firstName: firstName, lastName: lastName, email: email, gender: gender)
//                    dismiss()
//                }
//            }
//            .padding(.horizontal, 20)
//            .navigationTitle("Edit profiles")
//        }
//    }
   MARK: - Variables
//    @Environment(\.dismiss) var dismiss
//    @EnvironmentObject var userProfileViewModel: UserProfileViewModel
//    
//    let id: String
//    @State private var firstName: String
//    @State private var lastName: String
//    @State private var email: String
//    @State private var gender: String
// }
//
// struct ProfileEditView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileEditView(profile: FireProfile(userId: " ", firstName: "firstName", lastName: "lastName", email: "email", gender: "String"))
//    }
// }
