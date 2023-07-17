//
//  ProductDetailDesign.swift
//  alisveriApp
//
//  Created by Eyüphan Akkaya on 12.07.2023.
//

import SwiftUI
import Kingfisher

struct ProductDetailDesign: View {
    var productDetail: Product
    
    @State var gecisYap = false
    @ObservedObject var homePageViewModel = HomePageViewModel()
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                VStack {
                    TabView {
                        if let productDetails = productDetail {
                            ForEach(productDetails.images, id: \.self) { image in
                                KFImage(URL(string: image))
                                    .resizable()
                                    .scaledToFit()
                            }
                        }
                    }
                    .tabViewStyle(PageTabViewStyle())
                    .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                }
                .frame(width: 200,height: 200)
                
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
                        homePageViewModel.favourites.append(productDetail)
                        gecisYap = true
                        //                    print(homePageViewModel.fa)
                    } label: {
                        HStack {
                            Text("Favoriler")
                            Image(systemName: "heart")
                        }
                    }.sheet(isPresented: $gecisYap , content: {
                        Favorites(homePageViewModel: homePageViewModel)
                    })
                    .frame(width: 350,height: 60)
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(20)
                }
            }
        }
    }
}



