//
//  WeatherImageView.swift
//  AbschlussProjekt
//
//  Created by Nouiaskarnian on 27.11.23.
//

import SwiftUI

struct WeatherImageView: View {
    let weatherDescription: String

    var body: some View {
        Image(weatherImageName())
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 100, height: 100)
            .padding()
    }

    func weatherImageName() -> String {
        switch weatherDescription {
        case "Clear":
            return "sun"
        case "Clouds":
            return "cloud"
        case "Rain":
            return "rain"
        // Füge hier weitere Wetterbedingungen hinzu
        default:
            return "questionmark" // Standardbild für unbekannte Wetterbedingungen
        }
    }
}
#Preview {
    WeatherImageView(weatherDescription: "String")
}
