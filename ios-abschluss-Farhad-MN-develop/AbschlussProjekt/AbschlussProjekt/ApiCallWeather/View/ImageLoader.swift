//
//  ImageLoader.swift
//  AbschlussProjekt
//
//  Created by Nouiaskarnian on 26.11.23.
//

// import SwiftUI
// import Combine
//
// class ImageLoader: ObservableObject {
//    @Published var image: UIImage?
//    
//    private var cancellable: AnyCancellable?
//    
//    init(urlString: String) {
//        guard let url = URL(string: urlString) else { return }
//        
//        cancellable = URLSession.shared.dataTaskPublisher(for: url)
//            .map { UIImage(data: $0.data) }
//            .replaceError(with: nil)
//            .receive(on: DispatchQueue.main)
//            .assign(to: \.image, on: self)
//    }
// }
