//
//  SplashScreen.swift
//  alisveriApp
//
//  Created by Eyüphan Akkaya on 20.07.2023.
//

import SwiftUI

struct SplashScreen: View {
    @State var isActive = false
    var body: some View {
        if isActive {
            ContentView()
        } else {
            VStack {
                Image(systemName: "heart")
                    .resizable()
                    .frame(width: 100,height: 100)
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                    self.isActive = true
                }
            }
        }

    }
        
}
  

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
