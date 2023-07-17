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
    
    @Published  var productList =  [Product]() // tüm ürünler
    @Published  var favourites =  [Product]() // sadece favorilere eklenecek olanlar buraya
    
    
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
   
    
}
