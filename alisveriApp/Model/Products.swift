//
//  Products.swift
//  alisveriApp
//
//  Created by Eyüphan Akkaya on 6.07.2023.
//

import Foundation

struct Products: Identifiable {
    var id: Int?
    var name: String?
    var price: Int?
    
    init() {
    }
    
    init(id: Int, name: String, price: Int) {
        self.id = id
        self.name = name
        self.price = price
    }
}
