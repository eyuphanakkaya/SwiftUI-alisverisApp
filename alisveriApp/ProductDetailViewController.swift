//
//  ProductDetailViewController.swift
//  alisveriApp
//
//  Created by Eyüphan Akkaya on 7.07.2023.
//

import SwiftUI

struct ProductDetailViewController: View {
    
    @State private var detayList = [ProductsDetail]()
    var body: some View {
        VStack {
            ForEach(detayList){ detay in
                DetayTasarim(urunDetay: detay)
              /*  NavigationLink(destination: Text("Destination"), label: {Text("Detay") })*/
                    
            }
        }
        .onAppear{
            //var urun = Products()
            let pd1 = ProductsDetail(id: 1, statment: "uzun metin", image: "resim1", price: 1200, title: "Ayakkabı Modeli", productId: 1)
           /* let pd2 = ProductsDetail(id: 2, statment: "uzun metin", image: "resim1", price: 1200, title: "Ayakkabı Modeli", productId: 2)
            let pd3 = ProductsDetail(id: 3, statment: "uzun metin", image: "resim1", price: 1200, title: "Ayakkabı Modeli", productId: 3)
            let pd4 = ProductsDetail(id: 4, statment: "uzun metin", image: "resim1", price: 1200, title: "Ayakkabı Modeli", productId: 4)
            let pd5 = ProductsDetail(id: 5, statment: "uzun metin", image: "resim1", price: 1200, title: "Ayakkabı Modeli", productId: 5)*/
            
            detayList.append(pd1)
  
            
        }
    }
}
struct DetayTasarim: View {
    var urunDetay = ProductsDetail()
    var body: some View {
        VStack(spacing: 20) {
                Image(urunDetay.image!)
                    .resizable()
                    .scaledToFit()
                    .offset(y:CGFloat(-150) )
            Text("Ayakkabı")
                .frame(alignment: .leading)
            Text(urunDetay.title!)
            Text(urunDetay.statment!)
            Text("\(urunDetay.price!)")
            VStack() {

            }
        }
    }
}

struct ProductDetailViewController_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailViewController()
    }
}
