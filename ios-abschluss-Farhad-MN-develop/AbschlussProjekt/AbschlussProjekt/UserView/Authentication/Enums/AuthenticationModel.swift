//
//  AuthenticationModel.swift
//  AbschlussProjekt
//
//  Created by Nouiaskarnian on 16.11.23.
//

import Foundation

// Das ist eine Enumeration `AuthenticationModel`, die zwei Fälle hat: Login und Register.
// Sie bietet Eigenschaften, um Titel und alternative Titel für den Authentifizierungsfluss zu erhalten.
enum AuthenticationModel {
    case login, register
    
    // MARK: Gibt je nach Authentifizierungsmodus den passenden Titel zurück.
    var title: String {
        switch self {
        case .login: return "Anmelden"
        case .register: return "Registrieren"
        }
    }
    // MARK: Gibt je nach Authentifizierungsmodus den passenden alternativen Titel zurück.
    var alternativeTitle: String {
        switch self {
        case .login: return "Noch kein Konto? Registrieren →"
        case .register: return "Schon registriert? Anmelden →"
        }
    }
}
