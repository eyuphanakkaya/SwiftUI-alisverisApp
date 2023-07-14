//
//  Favorites.swift
//  alisveriApp
//
//  Created by Eyüphan Akkaya on 11.07.2023.
//
import SwiftUI


struct Favorites: View {
    @ObservedObject var favViewModel = FavorilerViewModel()
    @State var viewModel = HomePageViewModel()
    @AppStorage("favList") var favListData: Data = Data()
    var body: some View {
        NavigationView {
            ScrollView() {
                LazyVGrid(columns: [GridItem(.flexible())
                    ,GridItem(.flexible())],spacing: 20) {
                    
                    ForEach(favViewModel.urunList,id: \.self) { urun in
                        FavoriDesign(favProduct: urun)
                        
                    }
                    .padding(.vertical,120)
                    .padding(.horizontal,-15)
                    .offset(y: -100)
                }
                    .padding(.horizontal)
            }
            .navigationTitle("Favoriler")
            
        }
        .onAppear{
           
        }


        
    }

       
    
}


struct IkinciViewController_Previews: PreviewProvider {
    static var previews: some View {
        Favorites()
    }
}
