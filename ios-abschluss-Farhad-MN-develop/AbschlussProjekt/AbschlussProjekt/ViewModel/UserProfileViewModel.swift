//
//  UserProfileViewModel.swift
//  AbschlussProjekt
//
//  Created by Nouiaskarnian on 20.11.23.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

// class UserProfileViewModel: ObservableObject {
//
Mark: - Variables
//    
//    private var listener: ListenerRegistration?
//    
//    @Published var profiles: [FireProfile] = []
// }

//
// extension UserProfileViewModel {
//    func createProfile(firstName: String, lastName: String, email: String, gender: String) {
//        guard let userId = FirebaseManager.shared.userId else { return }
//        
//        let profile = FireProfile(userId: userId, firstName: firstName, lastName: lastName, email: email, gender: gender)
//        
//        do {
//            try FirebaseManager.shared.database.collection("profiles").addDocument(from: profile)
//        } catch let error {
//            print("Error saving profile: \(error)")
//        }
//        
//    }
// }

//
// extension UserProfileViewModel {
//    func fetchProfiles() {
//        guard let userId =  FirebaseManager.shared.userId else { return }
//        
//        self.listener = FirebaseManager.shared.database.collection("profiles").order(by: "firstName").whereField("userId", isEqualTo: userId)
//            .addSnapshotListener { QuerySnapshot, error in
//                if let error {
//                    print(error.localizedDescription)
//                    return
//                }
//                guard let documents = QuerySnapshot?.documents else {
//                    print("Error loading profile")
//                    return
//                }
//                self.profiles = documents.compactMap { queryDocumentSnapshot -> FireProfile? in
//                    try? queryDocumentSnapshot.data(as: FireProfile.self)
//                }
//            }
//    }
//    
//    func removeListener() {
//        profiles.removeAll()
//        listener?.remove()
//    }
// }
//
 MARK: - Upate
//
// extension UserProfileViewModel {
//    func updateProfil(with id: String, firstName: String, lastName: String, email: String, gender: String) {
//        let data = ["firstName": firstName, "lastName": lastName, "email": email, "gender": gender]
//        
//        FirebaseManager.shared.database.collection("profiles").document(id).setData(data, merge: true) { error in
//            if let error {
//                print("Profile has not been updated", error.localizedDescription)
//                return
//            }
//            print("Profile has been updated!")
//            
//        }
//    }
//    
// }
//
 MARK: - Delete
//
// extension UserProfileViewModel {
//    func deleteProfile(with id: String) {
//        FirebaseManager.shared.database.collection("profiles").document(id).delete() { error in
//            if let error {
//                print("Profile cannot be deleted", error.localizedDescription)
//                return
//            }
//            print("Profile with ID \(id) was deleted")
//        }
//    }
// }
