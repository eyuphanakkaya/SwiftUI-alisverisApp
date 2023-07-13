//
//  ProductDetailDesign.swift
//  alisveriApp
//
//  Created by Eyüphan Akkaya on 12.07.2023.
//

import SwiftUI

struct ProductDetailDesign: View {
    var productDetail: Product
    var body: some View {
        VStack(spacing: 20) {
            ForEach(productDetail.images,id: \.self) { image in
                //HomePage().homeViewModel.loadImage(from: image)
            }
                
            VStack(alignment: .leading,spacing: 15) {
                Text(productDetail.category.name)
                    .font(Font.custom("Helvetica", size: 20))
                Text(productDetail.title)
                    .font(Font.custom("Helvetica", size: 30))
                Text("US$\(productDetail.price)")
                    .font(Font.custom("Helvetica", size: 20))
                Text(productDetail.description)
                    .font(Font.custom("Helvetica", size: 20))
                Text("View Products Details")
                    .font(Font.custom("Helvetica", size: 15))
                    .foregroundColor(.gray)
                
            }
            .offset(x: CGFloat(10))
            VStack(spacing: 20) {
                Button("Select Size") {
                    print("Ayak numara seçildi")
                }
                .frame(width: 350,height: 60)
                .foregroundColor(.black)
                .background(Color.white)
                .border(.gray)
                .cornerRadius(20)
                
                Button(action: {
                    print("Sepete eklendi")
                }) {
                    HStack {
                        Text("Add Bag")
                        Image(systemName: "bag")
                    }
                        
                }
                .frame(width: 350,height: 60)
                .background(Color.black)
                .foregroundColor(.white)
                .cornerRadius(20)
                
                Button {
                    print("Favorilere Eklendi")
                } label: {
                    HStack {
                        Text("Favoriler")
                        Image(systemName: "heart")
                    }
                }
                .frame(width: 350,height: 60)
                .background(Color.red)
                .foregroundColor(.white)
                .cornerRadius(20)

    
                
            }
        }
    }
}



