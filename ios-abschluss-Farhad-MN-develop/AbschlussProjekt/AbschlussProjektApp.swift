//
//  AbschlussProjektApp.swift
//  AbschlussProjekt
//
//  Created by Nouiaskarnian on 16.11.23.
//

import SwiftUI
import Firebase
import FirebaseFirestore
import FirebaseStorage

@main
struct AbschlussProjektApp: App {
    
    
    init() {
        
        FirebaseConfiguration.shared.setLoggerLevel(.min)
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        
            WindowGroup {
                if userViewModel.isUserLoggedIn {
                    MainTabView()
                        .environmentObject(userViewModel)
                } else {
                    AuthenticationView()
                        .environmentObject(userViewModel)
                }
            }
        }
    
    @StateObject var userViewModel = UserViewModel()
    
    }
