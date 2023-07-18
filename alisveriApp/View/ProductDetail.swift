//
//  ProductDetailViewController.swift
//  alisveriApp
//
//  Created by Eyüphan Akkaya on 7.07.2023.
//

import SwiftUI

struct ProductDetail: View {
    @StateObject var homeViewModel:  HomePageViewModel
    let product: Product?
    var body: some View {
        VStack {
            ForEach(homeViewModel.productList,id: \.self){ productDetail in
                
                if product?.id == productDetail.id{
                    ProductDetailDesign(productDetail: productDetail, homePageViewModel: homeViewModel)
                }
                
             
            }
        }
        .onAppear{
            homeViewModel.fetchProduct()
        }
    }

}

/*struct ProductDetailViewController_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetail(value: , product: nil)
    }
}*/
