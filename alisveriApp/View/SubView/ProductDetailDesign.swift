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
    @State var showAlert = false

    @StateObject var homePageViewModel: HomePageViewModel
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
                    
                    Button {
                        showAlert = true
                    } label: {
                        HStack {
                            
                            Text("Add Basket")
                            Image(systemName: "bag")
                        }
                    }
                    .alert(isPresented: $showAlert){
                        Alert(title: Text("Bilgilendirme"),
                        message: Text("Ürün Sepete Eklensin Mi?"),
                        primaryButton: .destructive(Text("İptal")),
                              secondaryButton: .cancel(Text("Tamam")) {
                            if !homePageViewModel.basket.contains {$0.id == productDetail.id}  {
                                homePageViewModel.basket.append(productDetail)
                            } else {
                               print("Bu ürün zaten var")
                            }
                        }
                              
                        )
                    }
                    .frame(width: 350,height: 60)
                    .background(Color.black)
                    .foregroundColor(.white)
                    .cornerRadius(20)
                    
                    Button {
                            if !homePageViewModel.favourites.contains { $0.id == productDetail.id } {
                                homePageViewModel.favourites.append(productDetail)
                            } else {
                                print("Bu Ürün Zaten Var")
                                if let selectedIndex = homePageViewModel.favourites.firstIndex(of: productDetail) {
                                    homePageViewModel.favourites.remove(at: selectedIndex)
                                    
                                }
                            }
                        
                    } label: {
                        HStack {
                            Text("Favoriler")
                            Image(systemName: homePageViewModel.favourites.contains { $0.id == productDetail.id } ? "heart.fill":"heart")
                        }
                    }
                    /*.sheet(isPresented: $gecisYap , content: {
                        Favorites(homePageViewModel: homePageViewModel)
                    })*/
                    .frame(width: 350,height: 60)
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(20)
                }
            }
        }
    }
}



