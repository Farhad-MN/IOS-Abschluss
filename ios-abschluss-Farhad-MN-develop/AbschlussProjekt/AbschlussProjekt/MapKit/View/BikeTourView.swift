//
//  BikeTourView.swift
//  AbschlussProjekt
//
//  Created by Nouiaskarnian on 29.11.23.
//

// import SwiftUI
// import MapKit
//
// struct BikeTourView: View {
//    @StateObject var mapViewModel = MapViewModel()
//
//        var body: some View {
//            VStack {
//                Picker("Activity", selection: $mapViewModel.selectedActivity) {
//                    Text("Fahrrad").tag(Activity(name: "Fahrrad"))
//                    Text("Laufen").tag(Activity(name: "Laufen"))
//                    Text("Rennrad").tag(Activity(name: "Rennrad"))
//                    Text("Jogging").tag(Activity(name: "Jogging"))
//                    Text("Mountainbike").tag(Activity(name: "Mountainbike"))
//                }
//                .pickerStyle(SegmentedPickerStyle())
//                .padding()
//
//                Button("Generate Route") {
//                    mapViewModel.generateRoute()
//                }
//                .padding()
//
//                if let route = mapViewModel.route {
//                    MapView(route: route)
//                        .edgesIgnoringSafeArea(.all)
//                } else {
//                    Text("Wähle eine Aktivität und generiere die Route.")
//                        .padding()
//                }
//            }
//        }
//    }
//
// #Preview {
//    BikeTourView()
// }
