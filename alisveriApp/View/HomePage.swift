//
//  BirinciViewController.swift
//  alisveriApp
//
//  Created by Eyüphan Akkaya on 6.07.2023.
//

import SwiftUI

struct HomePage: View {
    @ObservedObject var homeViewModel: HomePageViewModel
    @State private var status = true
    @State private var selectedProduct: Product?
    @State private var showFavorites = false
    

    var body: some View {
        ZStack {
        NavigationView {
            ScrollView{
                LazyVGrid(columns: [GridItem(.flexible()),GridItem(.flexible())],spacing: 10) {
                    ForEach(homeViewModel.productList,id: \.self){ product in
                        HomeDesign(product: product)
                            .onTapGesture {
                                selectedProduct = product
                            }
                            .padding(.vertical,120)
                            .padding(.horizontal,-15)
                    }
                }
                .navigationTitle("Ürünler")
                .toolbar {
                    ToolbarItem {
                        Menu {
                            Button {
                                if status {
                                    homeViewModel.productList.sort{$0.title<$1.title}
                                }
                               
                                print("A'dan Z'ye sıralandı")
                            } label: {
                                Text("A'dan Z'ye")
                            }
                            Button {
                                homeViewModel.productList.sort{ $0.price > $1.price}
                                print("Azalan fiyat")
                            } label: {
                                Text("Azalan fiyat")
                            }
                            Button {
                                homeViewModel.productList.sort{ $0.price < $1.price}
                                print("Artan fiyat")
                            } label: {
                                Text("Artan fiyat")
                            }
                        } label: {
                            Image(systemName: "menucard")
                        }

                    }

                }
            }
           
            .onAppear{
                homeViewModel.fetchProduct()
            }
            
        }.padding(10)
               
    }
        .edgesIgnoringSafeArea(.top)
        .sheet(item: $selectedProduct) { product in
                
            ProductDetail(homeViewModel: homeViewModel, product: product)
        }
        
        
    }
}

struct BirinciViewController_Previews: PreviewProvider {
    static var previews: some View {
        HomePage(homeViewModel: HomePageViewModel())
    }
}
