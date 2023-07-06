//
//  ContentView.swift
//  alisveriApp
//
//  Created by Eyüphan Akkaya on 6.07.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View { 
            TabView {
                BirinciViewController()
                    .tabItem {
                        Image(systemName: "house")
                        Text("Ana Sayfa")
                    }
                IkinciViewController()
                    .tabItem {
                        Image(systemName: "heart")
                        Text("Favoriler")
                    }
                UcuncuViewController()
                    .tabItem {
                        Image(systemName: "gear")
                        Text("Ayarlar")
                    }
            }
            .accentColor(.black)

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
