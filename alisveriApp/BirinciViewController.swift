//
//  BirinciViewController.swift
//  alisveriApp
//
//  Created by Eyüphan Akkaya on 6.07.2023.
//

import SwiftUI

struct BirinciViewController: View {
    
    @State private var productList =  [Products]()

    var body: some View {
        NavigationStack {
                ScrollView{
                    LazyVGrid(columns: [GridItem(.flexible()),GridItem(.flexible())],spacing: 20) {
                        ForEach(productList){ urun in
                            Tasarim(urun: urun,genislik: 170,yukseklik: 150)
                                .onTapGesture {
                                    print(urun.name!)
                                }
                        }
                    }
                }
                
                .onAppear{
                    var liste = [Products]()
                    let p1 = Products(id: 1,name: "Nike Koşu Ayakkabı", price: 1200)
                    let p2 = Products(id: 2,name: "Nike Yürüyüş Ayakkabı", price: 1300)
                    let p3 = Products(id: 3,name: "Adidas Koşu Ayakkabı", price: 900)
                    let p4 = Products(id: 4,name: "Puma Koşu Ayakkabı", price: 1100)
                    let p5 = Products(id: 5,name: "Vans Koşu Ayakkabı", price: 1300)
                    let p6 = Products(id: 6,name: "Vans Koşu Ayakkabı", price: 1300)
                    let p7 = Products(id: 7,name: "Hummel Koşu Ayakkabı", price: 1500)
                    let p8 = Products(id: 8,name: "Hummel Koşu Ayakkabı", price: 1500)
                    let p9 = Products(id: 9,name: "Hummel Koşu Ayakkabı", price: 1500)
                    let p10 = Products(id: 10,name: "Hummel Koşu Ayakkabı", price: 1500)
                    let p11 = Products(id: 11,name: "Hummel Koşu Ayakkabı", price: 1500)
                    
                    
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
    
    struct Tasarim: View {
        var urun = Products()
        var genislik = 0.0
        var yukseklik = 0.0
        var body: some View {
            VStack(spacing: 20) {
                Text(urun.name!)
                
                Text("\(urun.price!)")
            }
            .frame(width: genislik,height: yukseklik)
            .background(Color.blue)
            .cornerRadius(10)
        }
    }
    private func yeniUrunler(){
       
    }
    
    
}

struct BirinciViewController_Previews: PreviewProvider {
    static var previews: some View {
        BirinciViewController()
    }
}
