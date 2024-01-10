//
//  FireProfile.swift
//  AbschlussProjekt
//
//  Created by Nouiaskarnian on 22.11.23.
//

import Foundation

import FirebaseFirestoreSwift

// MARK: Definition einer Datenstruktur 'FireProfile', die 'Codable' und 'Identifiable' ist.
struct FireProfile: Codable, Identifiable {
    
    // MARK: Die Eigenschaft 'id' wird als Dokument-ID definiert und ist optional.
    @DocumentID var id: String?

    // MARK: Eigenschaften zur Speicherung von Benutzerdaten wie userId, Vor- und Nachname, E-Mail und Geschlecht
    var userId: String
    var firstName: String
    var lastName: String
    var email: String
    var gender: String

}
