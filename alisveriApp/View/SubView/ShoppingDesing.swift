//
//  ShoppingDesing.swift
//  alisveriApp
//
//  Created by Eyüphan Akkaya on 20.07.2023.
//

import SwiftUI

struct ShoppingDesing: View {
    @State var list = [Products]()
   
    var product: Product
    var body: some View {
        HStack(spacing: 20) {
            Text(product.title)
                .foregroundColor(Color("renk1"))
            Text("\(product.price ?? 0) $")
                .foregroundColor(Color("renk1"))
        }
    }
}


