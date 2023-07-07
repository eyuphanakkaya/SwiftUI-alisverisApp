//
//  ProductsDetail.swift
//  alisveriApp
//
//  Created by Eyüphan Akkaya on 6.07.2023.
//

import Foundation

class ProductsDetail: Identifiable {
    var id: Int?
    var statment: String?
    var image: String?
    var price: Int?
    var title: String?
    var productId: Int?
    
    init() {
    }
    
    init(id: Int, statment: String, image: String, price: Int, title: String, productId: Int) {
        self.id = id
        self.statment = statment
        self.image = image
        self.price = price
        self.title = title
        self.productId = productId
    }
    
    
}
