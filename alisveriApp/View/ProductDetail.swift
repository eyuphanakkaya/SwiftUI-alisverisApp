//
//  ProductDetailViewController.swift
//  alisveriApp
//
//  Created by Eyüphan Akkaya on 7.07.2023.
//

import SwiftUI

struct ProductDetail: View {
    
    @State private var detayList = [ProductsDetail]()
    let product: Products?
    var body: some View {
        VStack {
            
            ForEach(detayList){ detay in
                if product?.id == (detay.productId){
                    DetayTasarim(urunDetay: detay)
                }
              /*  NavigationLink(destination: Text("Destination"), label: {Text("Detay") })*/
                    
            }
        }
        .onAppear{
            //var urun = Products()
            let pd1 = ProductsDetail(id: 1, statment: "Nike Air Max, ikonik ve yenilikçi tasarıma sahip, topukta görünür hava yastığı bulunan bir ayakkabı serisidir. Performans ve stil açısından popülerdir.", image: (product?.image)!, price: (product?.price)!, title: (product?.name)!, productId: 1)
            let pd2 = ProductsDetail(id: 2, statment: "Nike Air Max, ikonik ve yenilikçi tasarıma sahip, topukta görünür hava yastığı bulunan bir ayakkabı serisidir. Performans ve stil açısından popülerdir.", image: (product?.image)!, price: (product?.price)!, title: (product?.name)!, productId: 2)
            let pd3 = ProductsDetail(id: 3, statment: "Nike Air Max, ikonik ve yenilikçi tasarıma sahip, topukta görünür hava yastığı bulunan bir ayakkabı serisidir. Performans ve stil açısından popülerdir.", image: (product?.image)!, price: (product?.price)!, title: (product?.name)!, productId: 3)
            let pd4 = ProductsDetail(id: 4, statment: "Nike Air Max, ikonik ve yenilikçi tasarıma sahip, topukta görünür hava yastığı bulunan bir ayakkabı serisidir. Performans ve stil açısından popülerdir.", image: (product?.image)!, price: (product?.price)!, title: (product?.name)!, productId: 4)
            
            detayList.append(pd1)
            detayList.append(pd2)
            detayList.append(pd3)
            detayList.append(pd4)
  
            
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
            VStack(alignment: .leading,spacing: 15) {
                Text("Ayakkabı")
                    .font(Font.custom("Helvetica", size: 20))
                Text(urunDetay.title!)
                    .font(Font.custom("Helvetica", size: 30))
                Text("US$\(urunDetay.price!)")
                    .font(Font.custom("Helvetica", size: 20))
                Text(urunDetay.statment!)
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
    
                
            }
        }
    }
}

struct ProductDetailViewController_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetail(product: nil)
    }
}
