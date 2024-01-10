//
//  CategoryViewModel.swift
//  AbschlussProjekt
//
//  Created by Nouiaskarnian on 23.11.23.
//

import SwiftUI
import Combine

class CategoryViewModel: ObservableObject {
    
    let tabbarSize: CGFloat = 60
    
    // MARK: Ein Observable-Objekt, das eine Liste von Kategorien enthält und Änderungen an diesen veröffentlicht
    @Published var category: [Category] = []
    
    init () {
        // MARK: Ruft die Funktion fetchCategory auf, um Kategorien zu initialisieren
        fetchCategory()
    }
    
    // MARK: Eine Funktion zum Initialisieren von Kategorien und Zuweisung zu 'category'
    func fetchCategory() {
        
        // MARK: Erstellen von Kategorie-Instanzen mit Titel und Bildern
        let mountainbike = Category(title: "Mountainbike", image: "mountainbike")
        let rennrad = Category(title: "Rennrad", image: "rennrad")
        let fahrrad = Category(title: "Fahrrad", image: "fahrrad")
        let bikepacking = Category(title: "Bikepacking", image: "bikepacking")
        let laufen = Category(title: "Laufen", image: "laufen")
        let wandern = Category(title: "Wandern", image: "wandern")
        
        // MARK: Weist der 'category'-Variable eine Liste dieser Kategorien zu
        category = [mountainbike, rennrad, fahrrad, bikepacking, laufen, wandern ]
    }
}
