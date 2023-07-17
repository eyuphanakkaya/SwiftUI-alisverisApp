//
//  FavoritesDesign.swift
//  alisveriApp
//
//  Created by Eyüphan Akkaya on 14.07.2023.
//

import Foundation
import SwiftUI
import Kingfisher
 
struct FavoriDesign: View {

    var favProduct: Product
    var body: some View {
        GeometryReader { geometry in
            VStack {
                TabView {
                    ForEach(favProduct.images,id: \.self) { favImage in
                         KFImage(URL(string: favImage))
                            .resizable()
                            .scaledToFit()
                    }
                }
                VStack(spacing: 20) {
                    if let name = favProduct.title,let price = favProduct.price {
                        Text(name)
                            .bold()
                            .font(Font.custom("Helvetica", size: 15))
                        Text("$\(price)")
                            .bold()
                            .font(Font.custom("Helvetica", size: 15))
                    }
                    
                }
                .frame(width: geometry.size.width * 0.8,height: geometry.size.height * 25)
                .background(Color("deneme"))
                .cornerRadius(10)
            .padding(.horizontal)
            }
            .onAppear{
                print(favProduct.title)
            }

            
        }
        
    }
}
