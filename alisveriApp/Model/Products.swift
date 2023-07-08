//
//  Products.swift
//  alisveriApp
//
//  Created by Eyüphan Akkaya on 6.07.2023.
//

import Foundation
import UIKit

struct Products: Identifiable {
    var id: Int?
    var name: String?
    var price: Int?
    var image: String?
    var numberOfColor: String?
    
    init() {
    }
    
    init(id: Int, name: String, price: Int,image: String,numberOfColor: String) {
        self.id = id
        self.name = name
        self.price = price
        self.image = image
        self.numberOfColor = numberOfColor
    }
}
