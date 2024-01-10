//
//  WelcomeView.swift
//  AbschlussProjekt
//
//  Created by Nouiaskarnian on 23.11.23.
//

import SwiftUI

struct WelcomeView: View {
    @EnvironmentObject var locationManager: LocationManager
    @Binding var cityName: String
    @Binding var isSearching: Bool
    @Binding var errorAlert: Bool
    var weatherManagerCity: WeatherViewModel
    @Binding var weather: ResponseBody?
    @Binding var showWeatherView: Bool
    
    var body: some View {
        VStack {
            VStack(spacing: 20) {
                Text("Welcome to the Weather App")
                    .bold().font(.title)
                
                HStack {
                    TextField("Enter city name", text: $cityName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                
                if !cityName.isEmpty {
                    Button(action: {
                        cityName = ""
                    }) {
                        Text("cancel")
                            .foregroundColor(.gray)
                            .padding(.trailing, 48)}
                }
            }
                Button(action: {
                    isSearching = true
                    Task {
                        do {
                            let fetchedWeather = try await weatherManagerCity.getWeatherForCity(cityName: cityName)
                            weather = fetchedWeather
                            isSearching = false
                            showWeatherView = true
                        } catch {
                            print("Error getting weather: \(error)")
                            isSearching = false
                            errorAlert = true
                        }
                    }
                }) {
                    Text("Search")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(8)
                }
                .alert(isPresented: $errorAlert) {
                    Alert(title: Text("Error"), message: Text("Failed to fetch weather data"), dismissButton: .default(Text("OK")))
                }
            }
            .multilineTextAlignment(.center)
            .padding()
            
            if isSearching {
                LoadingView()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView(cityName: .constant(""), isSearching: .constant(false), errorAlert: .constant(false), weatherManagerCity: WeatherViewModel(), weather: .constant(nil), showWeatherView: .constant(false))
            .environmentObject(LocationManager())
    }
}
