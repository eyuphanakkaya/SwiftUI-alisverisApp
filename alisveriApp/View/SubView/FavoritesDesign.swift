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

                VStack(spacing: 20) {
                    VStack {
                        TabView {
                            if let fav = favProduct {
                                ForEach(fav.images, id: \.self) { image in
                                    KFImage(URL(string: image))
                                        .resizable()
                                        .scaledToFit()
                                }
                            }
                        }
                        .tabViewStyle(PageTabViewStyle())
                        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                    }
                    .frame(width: 120,height: 150)
                    VStack(spacing: 10) {
                        if let name = favProduct.title,let price = favProduct.price,let cate = favProduct.category.name {
                            Text(name)
                                .bold()
                                .font(Font.custom("Helvetica", size: 15))
                            Text("$\(price)")
                                .bold()
                                .font(Font.custom("Helvetica", size: 15))
                            Text(cate)
                                .bold()
                                .font(Font.custom("Helvetica", size: 15))
                        }
                    }
                    
                }
                .frame(width: geometry.size.width * 0.8,height: geometry.size.height * 25)
                .background(Color("deneme"))
                .cornerRadius(10)
            .padding(.horizontal)
            .onAppear{
                print(favProduct.title)
            }

            
        }
        
    }
}
