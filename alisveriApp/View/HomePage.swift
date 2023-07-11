//
//  BirinciViewController.swift
//  alisveriApp
//
//  Created by Eyüphan Akkaya on 6.07.2023.
//

import SwiftUI

struct HomePage: View {

    @State private var productList =  [Product]()
    @State private var status = false
    @State private var selectedProduct: Product?

    var body: some View {
        ZStack {
            Color.yellow.edgesIgnoringSafeArea(.all)
        NavigationView {
            ScrollView{
                LazyVGrid(columns: [GridItem(.flexible()),GridItem(.flexible())],spacing: 10) {
                    
                    ForEach(productList,id: \.self){ product in
                        Tasarim(product: product)
                            .onTapGesture {
                                status = true
                                selectedProduct = product
                            }
                            .padding(.vertical,120)
                            .padding(.horizontal,-15)
                            
                    }
                }
            }
            .ignoresSafeArea()
            
            .onAppear{
                fetchProduct()
            }
            
        }.padding(10)
        

    }
        .sheet(item: $selectedProduct) { urun in
           ProductDetail(product: urun)
        }
        


    }
    func fetchProduct() {
        guard let url = URL(string: "https://api.escuelajs.co/api/v1/categories/4/products?offset=0&limit=30") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let data, error == nil {
                do {
                    let result = try JSONDecoder().decode([Product].self, from: data)
                    
                    DispatchQueue.main.async {
                        self.productList = result
                    }
                } catch let error {
                    print(error.localizedDescription)
                }
            }
        }
        .resume()
    }
    struct Tasarim: View {
        var product:Product?
        var body: some View {
            
            GeometryReader { geometry in
                VStack(spacing: 10) {
                    
                    if let products = product {
                        ForEach(products.images,id:\.self) { image in
                            Image(image)
                                .resizable()
                                .scaledToFit()
                        }

                        Text(products.title)
                            .bold()
                            .font(Font.custom("Helvetica", size: 15))
                        Text("\(products.price) TL")
                            .font(Font.custom("Helvetica",size: 15))
                        Text(products.category.name)
                            .bold()
                            .font(Font.custom("Helvetica", size: 15))
                    }
        
                    
                }
                .frame(width: geometry.size.width * 0.8,height: geometry.size.height * 25)
                .background(Color.blue)
                .cornerRadius(10)
                .padding(.vertical,-100)
                .padding()
            }

        }
            
    }
    
    func urunler(){
        var liste = [Products]()
        let p1 = Products(id: 1,name: "Nike Koşu Ayakkabı", price: 1200,image: "resim1",numberOfColor: "5 Renk")
        let p2 = Products(id: 2,name: "Nike Yürüyüş Ayakkabı", price: 1300,image: "resim1",numberOfColor: "5 Renk")
        let p3 = Products(id: 3,name: "Adidas Koşu Ayakkabı", price: 900,image: "resim2",numberOfColor: "4 Renk")
        let p4 = Products(id: 4,name: "Puma Koşu Ayakkabı", price: 1100,image: "resim3",numberOfColor: "3 Renk")
        let p5 = Products(id: 5,name: "Vans Koşu Ayakkabı", price: 1300,image: "resim2",numberOfColor: "7 Renk")
        let p6 = Products(id: 6,name: "Vans Koşu Ayakkabı", price: 1300,image: "resim1",numberOfColor: "6 Renk")
        let p7 = Products(id: 7,name: "Hummel Koşu Ayakkabı", price: 1500,image: "resim3",numberOfColor: "4 Renk")
        let p8 = Products(id: 8,name: "Hummel Koşu Ayakkabı", price: 1500,image: "resim2",numberOfColor: "3 Renk")
        let p9 = Products(id: 9,name: "Hummel Koşu Ayakkabı", price: 1500,image: "resim3",numberOfColor: "2 Renk")
        let p10 = Products(id: 10,name: "Hummel Koşu Ayakkabı", price: 1500,image: "resim2",numberOfColor: "6 Renk")
        let p11 = Products(id: 11,name: "Hummel Koşu Ayakkabı", price: 1500,image: "resim1",numberOfColor: "6 Renk")
        
        
        liste.append(p1)
        liste.append(p2)
        liste.append(p3)
        liste.append(p4)
        liste.append(p5)
        liste.append(p6)
        liste.append(p7)
        liste.append(p8)
        liste.append(p9)
        liste.append(p10)
        liste.append(p11)
        
        //productList = liste
    }
    
}

struct BirinciViewController_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}
