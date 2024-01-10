//
//  URLImage.swift
//  AbschlussProjekt
//
//  Created by Nouiaskarnian on 26.11.23.
//

// import SwiftUI
//
// import Combine
//
// struct URLImage: View {
//    @StateObject private var imageLoader: ImageLoader
//    private let placeholder: Image
//    
//    init(urlString: String, placeholder: Image = Image(systemName: "photo")) {
//        self.placeholder = placeholder
//        _imageLoader = StateObject(wrappedValue: ImageLoader(urlString: urlString))
//    }
//    
//    var body: some View {
//        if let image = imageLoader.image {
//            Image(uiImage: image)
//                .resizable()
//        } else {
//            placeholder
//                .resizable()
//        }
//    }
// }
//
// #Preview {
//    URLImage(urlString: "String")
// }
