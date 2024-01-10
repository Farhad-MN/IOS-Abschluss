//
//  Category.swift
//  AbschlussProjekt
//
//  Created by Nouiaskarnian on 23.11.23.
//

import Foundation

// MARK: Diese Struktur repräsentiert eine Kategorie mit
// einer eindeutigen ID, einem Titel und einem Bild.
struct Category: Identifiable {
    let id = UUID()
    let title: String
    let image: String
}
