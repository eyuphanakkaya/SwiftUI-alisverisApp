//
//  Product1.swift
//  alisveriApp
//
//  Created by Eyüphan Akkaya on 11.07.2023.
//

import Foundation


struct Product: Hashable,Codable,Identifiable{
    var id: Int
    var title: String
    var price: Int
    var description: String
    var images: [String]
    var category: Category
}
struct Category: Hashable,Codable{
    var id: Int
    var name: String
    var image: String
}

struct Products: Identifiable {
    var id: Int?
    var name: String?
    var price: Int?
    var image: String?
    var numberOfColor: String?

}
