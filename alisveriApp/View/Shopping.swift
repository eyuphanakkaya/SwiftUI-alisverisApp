//
//  Shopping.swift
//  alisveriApp
//
//  Created by Eyüphan Akkaya on 20.07.2023.
//

import SwiftUI

struct Shopping: View {
    @StateObject var homePageViewModel: HomePageViewModel
    @State var topla = 0
    var body: some View {
        NavigationView {
            List {
                ForEach(homePageViewModel.basket) { baskets in
                    ShoppingDesing(product: baskets)
                }
                Text("Toplam Tutar = \(topla) $")
                    .foregroundColor(.red)
            }
            .foregroundColor(.black)
            .onAppear {
                topla = homePageViewModel.basket.reduce(0) { $0 + ($1.price ?? 0) }
            }
        }
           
            
            .navigationTitle("Sepetim")
            
        }
        
    }


struct Shopping_Previews: PreviewProvider {
    static var previews: some View {
        Shopping(homePageViewModel: HomePageViewModel())
    }
}
