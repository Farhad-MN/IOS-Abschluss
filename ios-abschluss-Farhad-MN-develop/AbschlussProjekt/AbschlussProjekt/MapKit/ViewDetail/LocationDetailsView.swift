//
//  LocationDetailsView.swift
//  AbschlussProjekt
//
//  Created by Nouiaskarnian on 30.11.23.
//

import SwiftUI
import MapKit

struct LocationDetailsView: View {
    
    @Binding var mapselection: MKMapItem?
    @Binding var show: Bool
    @State private var lookAroundScene: MKLookAroundScene?
    @Binding var getDirections: Bool
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text(mapselection?.placemark.name ?? "")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Text(mapselection?.placemark.title ?? "")
                        .font(.footnote)
                        .foregroundStyle(.gray)
                        .lineLimit(2)
                        .padding(.trailing)
                }
                Spacer()
                
                Button {
                    show.toggle()
                    mapselection = nil
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .foregroundStyle(.gray, Color(.systemGray6))
                }
               
            }
                .padding(.horizontal)
                .padding(.top)
                
                if let scene = lookAroundScene {
                    LookAroundPreview(initialScene: scene)
                        .frame(height: 200)
                        .cornerRadius(12)
                        .padding()
                } else {
                    ContentUnavailableView("No preview available", systemImage: "eye.slash")
                }
            HStack(spacing: 24) {
                Button {
                    if let mapselection {
                        mapselection.openInMaps()
                    }
                } label: {
                    Text("Open in Maps")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 170, height: 48)
                        .background(.green)
                        .cornerRadius(12)
                }
                Button {
                    getDirections = true
                    show = false
                } label: {
                    Text("Get Directions")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 170, height: 48)
                        .background(.blue)
                        .cornerRadius(12)
                }
            }
            .onAppear {
                print("DEBUG: Die call on appear")
                fetschLookAroundPreview()
            }
            .onChange(of: mapselection) {
                print("DEBUG: Die call on change")
                fetschLookAroundPreview()
            }
            .padding()
        }
    }
}
    extension LocationDetailsView {
        func fetschLookAroundPreview() {
            if let mapselection {
                lookAroundScene = nil
                Task {
                    let request = MKLookAroundSceneRequest(mapItem: mapselection)
                    lookAroundScene = try? await request.scene
                }
            }
        }
    }


#Preview {
    LocationDetailsView(mapselection: .constant(nil), show: .constant(true), getDirections: .constant(false))
}
