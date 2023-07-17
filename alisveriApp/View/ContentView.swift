//
//  ContentView.swift
//  alisveriApp
//
//  Created by Eyüphan Akkaya on 6.07.2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var homeViewModel = HomePageViewModel()
    var body: some View { 
        ZStack {
            TabView {
                HomePage(homeViewModel: homeViewModel)
                        .tabItem {
                            Image(systemName: "house")
                                .foregroundColor(.blue)
                            Text("Ana Sayfa")
                        }
                Favorites(homePageViewModel: homeViewModel)
                        .tabItem {
                            Image(systemName: "heart")
                            Text("Favoriler")
                        }
                Ayarlar(homePageViewModel: homeViewModel)
                        .tabItem {
                            Image(systemName: "gear")
                            Text("Ayarlar")
                        }
                }
           
        }
        .background(Color.red)
        .accentColor(.red)
        .edgesIgnoringSafeArea(.all)
       

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
