//
//  BirinciViewController.swift
//  alisveriApp
//
//  Created by Eyüphan Akkaya on 6.07.2023.
//

import SwiftUI

struct AnaSayfa: View {
    
    @State private var productList =  [Products]()
    @State private var durum = false
    @State private var selectedProduct: Products?

    var body: some View {
        ZStack {
            Color.yellow.edgesIgnoringSafeArea(.all)
        NavigationStack {
            ScrollView{
                LazyVGrid(columns: [GridItem(.flexible()),GridItem(.flexible())],spacing: 10) {
                    
                    ForEach(productList){ urun in
                        Tasarim(urun: urun,genislik: 180,yukseklik: 250)
                            .onTapGesture {
                                durum = true
                                selectedProduct = urun
                            }
                            
                            
                    }
                }
            }
            
            .onAppear{
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
                
                productList = liste
            }
            
        }.padding(10)
        
    }
        .sheet(item: $selectedProduct) { urun in
            ProductDetail(product: urun)
        }
        

    }
    
    
    struct Tasarim: View {
        var urun = Products()
        var genislik = 0.0
        var yukseklik = 0.0
        var body: some View {
            
            VStack(spacing: 15) {

                Image(urun.image!)
                    .resizable()
                    .scaledToFit()
                   
                Text(urun.name!)
                    .bold()
                    .font(Font.custom("Helvetica", size: 15))
                Text("\(urun.price!) TL")
                    .font(Font.custom("Helvetica",size: 15))
                Text(urun.numberOfColor!)
                    .bold()
                    .font(Font.custom("Helvetica", size: 15))
                
                
            }
            .frame(width: genislik,height: yukseklik)
            .background(Color.blue)
            .cornerRadius(10)
        }
            
    }
    
}

struct BirinciViewController_Previews: PreviewProvider {
    static var previews: some View {
        AnaSayfa()
    }
}
