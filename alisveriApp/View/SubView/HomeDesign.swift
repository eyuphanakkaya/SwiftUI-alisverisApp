//
//  HomeDesign.swift
//  alisveriApp
//
//  Created by Eyüphan Akkaya on 12.07.2023.
//

import SwiftUI
import Kingfisher

struct HomeDesign: View {
        var product: Product?
        var body: some View {
            
            GeometryReader { geometry in
                VStack(spacing: 10) {
                    VStack {
                        TabView {
                            if let product = product {
                                ForEach(product.images, id: \.self) { image in
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
 
                    if let product = product {
                        Text(product.title)
                            .bold()
                            .font(Font.custom("Helvetica", size: 15))
                        
                        Text("\(product.price) $")
                            .font(Font.custom("Helvetica",size: 15))
                        Text(product.category.name)
                            .bold()
                            .font(Font.custom("Helvetica", size: 15))
                           
                    }
        
                    
                }
                .frame(width: geometry.size.width * 0.8,height: geometry.size.height * 25)
                .background(Color("deneme"))
                .cornerRadius(10)
                .padding(.vertical,-100)
                .padding()
            }

        }
            
    }
struct HomeDesign_Previews: PreviewProvider {
    static var previews: some View {
        HomeDesign()
    }
}
