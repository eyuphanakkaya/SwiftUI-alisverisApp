//
//  Favorites.swift
//  alisveriApp
//
//  Created by Eyüphan Akkaya on 11.07.2023.
//

import SwiftUI

struct Favorites: View {
    var urunList = [Products]()
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible())
                    ,GridItem(.flexible())],spacing: 20) {
                    ForEach(urunList,id: \.self) { urun in
                        Text(urun.name!)
                    }
                }
                
            }
            .navigationTitle("Favoriler")
            
        }
        .onAppear{
            var list = [Products]()
            let u1 = Products(id: 1, name: "Nike",price: 1233,image: "resim1")
            let u2 = Products(id: 2, name: "Nike",price: 1233,image: "resim1")
            let u3 = Products(id: 3, name: "Nike",price: 1233,image: "resim1")
            let u4 = Products(id: 4, name: "Nike",price: 1233,image: "resim1")
            list.append(u1)
            list.append(u2)
            list.append(u3)
            list.append(u4)
            
            DispatchQueue.main.async {
                self.urunList = list
            }
        }
        
    }
    
}
struct FavoriDesign: View {
    var body: some View {
        Text("resim")
    }
}


struct IkinciViewController_Previews: PreviewProvider {
    static var previews: some View {
        Favorites()
    }
}
