//
//  FireUser.swift
//  AbschlussProjekt
//
//  Created by Nouiaskarnian on 16.11.23.
//

import Foundation

// MARK: Definiert eine Struktur namens FireUser, die das Codable-Protokoll implementiert.
struct FireUser: Codable {
    
    var id: UUID
    var image: String
    var email: String
    var name: String
    var registeredAt: Date
    
}








// // MARK: Definition einer Datenstruktur 'FireProfile', die 'Codable' und 'Identifiable' ist.
// struct FireProfile: Codable, Identifiable {
//
//    // MARK: Die Eigenschaft 'id' wird als Dokument-ID definiert und ist optional.
//    @DocumentID var id: String?
//
//    // MARK: Eigenschaften zur Speicherung von Benutzerdaten wie userId, Vor- und Nachname, E-Mail und Geschlecht
//    var userId: String
//    var firstName: String
//    var lastName: String
//    var email: String
//    var gender: String
