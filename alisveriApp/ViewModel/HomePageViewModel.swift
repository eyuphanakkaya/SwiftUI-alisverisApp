//
//  AnasayfaViewModel.swift
//  alisveriApp
//
//  Created by Eyüphan Akkaya on 8.07.2023.
//

import Foundation
import SwiftUI
import Kingfisher

class HomePageViewModel: ObservableObject {
    
    @Published  var productList =  [Product]()
    
    
    func fetchProduct() {
        guard let url = URL(string: "https://api.escuelajs.co/api/v1/categories/4/products?offset=0&limit=30") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let data = data, error == nil {
                do {
                    let result = try JSONDecoder().decode([Product].self, from: data)
                    
                    DispatchQueue.main.async {
                        self.productList = result
                    }
                } catch let error {
                    print(error)
                }
            }
        }
        .resume()
    }
    func loadImage(from urlString: String) -> Image {
        // Resmi yükleme işlemi
        //kingfisher
        guard let url = URL(string: urlString),
              let data = try? Data(contentsOf: url),
              let image = UIImage(data: data) else {
            // Yükleme başarısız olduğunda veya placeholder resim kullanmak istediğinizde burayı güncelleyebilirsiniz.
            return Image(systemName: "photo")
        }
        return Image(uiImage: image)
    }
    
}
