//
//  UcuncuViewController.swift
//  alisveriApp
//
//  Created by Eyüphan Akkaya on 6.07.2023.
//

import SwiftUI

struct Ayarlar: View {
    @StateObject var homePageViewModel: HomePageViewModel
    @AppStorage("isMode") private var isMode = false
    var body: some View {
        NavigationView {
            VStack {
                Toggle("", isOn: $isMode)
                    .offset(x: -10 ,y: -300)
            }
            .navigationTitle("Ayarlar")
         }
        .preferredColorScheme(isMode ? .dark : .light)
    }
}
struct UcuncuViewController_Previews: PreviewProvider {
    static var previews: some View {
        Ayarlar(homePageViewModel: HomePageViewModel())
    }
}
