//
//  ProductDetailViewController.swift
//  alisveriApp
//
//  Created by Eyüphan Akkaya on 7.07.2023.
//

import SwiftUI

struct ProductDetail: View {
    
    @State private var detayList = [Product]()
    let product: Product?
    var body: some View {
        VStack {
            
            ForEach(detayList,id: \.self){ productDetail in
                if product?.id == (productDetail.id){
                    DetayTasarim(productDetail: productDetail)
                }
              /*  NavigationLink(destination: Text("Destination"), label: {Text("Detay") })*/
                    
            }
        }
        .onAppear{
            func fetchProducts() async{
                guard let url = URL(string: "https://api.escuelajs.co/api/v1/categories/4/products?offset=0&limit=30") else {
                    print("Veri Çekilemedi")
                    return}
                do {
                    let (data, _) =  try await URLSession.shared.data(from: url)
                    if let decodedResponse = try? JSONDecoder().decode([Product].self,from: data) {
                        detayList = decodedResponse
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
            
        }
    }
}
struct DetayTasarim: View {
    var productDetail:Product
    var body: some View {
        VStack(spacing: 20) {
            ForEach(productDetail.images,id: \.self) { image in
                Image(image)
                    .resizable()
                    .scaledToFit()
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
