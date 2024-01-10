//
//  TabItem.swift
//  AbschlussProjekt
//
//  Created by Nouiaskarnian on 16.11.23.
//

import Foundation

enum TabItem {
    
    case category, weather, person
    
    var title: String {
        switch self {
        case .category: return "Home"
        case .weather: return "Weather"
        case .person: return "Profile"
            
        }
    }
    var icon: String {
        switch self {
        case .category: return "house"
        case .weather: return "cloud.sun.rain"
        case .person: return "person"
        }
    }
}
