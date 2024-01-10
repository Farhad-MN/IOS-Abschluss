//
//  BikeTour.swift
//  AbschlussProjekt
//
//  Created by Nouiaskarnian on 29.11.23.
//

import SwiftUI
import MapKit

struct Activity: Hashable {
    let name: String
}

struct Location {
    var id: ObjectIdentifier
    
    let latitude: Double
    let longitude: Double
}

struct Route {
    let start: Location
    let end: Location
    let coordinates: [CLLocationCoordinate2D]
}
