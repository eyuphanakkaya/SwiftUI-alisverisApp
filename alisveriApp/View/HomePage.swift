//
//  BirinciViewController.swift
//  alisveriApp
//
//  Created by Eyüphan Akkaya on 6.07.2023.
//

import SwiftUI

struct HomePage: View {
    @ObservedObject var homeViewModel = HomePageViewModel()
    @State private var status = false
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
                                status = true
                                selectedProduct = product
                            }
                            .padding(.vertical,120)
                            .padding(.horizontal,-15)
                    }
                }
                .navigationTitle("Ürünler")
            }
           
            .onAppear{
                homeViewModel.fetchProduct()
            }
            
        }.padding(10)
               
    }
        .edgesIgnoringSafeArea(.top)
        .sheet(item: $selectedProduct, onDismiss: {
            showFavorites = true
        }) { product in
            ProductDetail(homeViewModel: homeViewModel, product: product)
        }
        
    }
}

struct BirinciViewController_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}
