//
//  SplashScreen.swift
//  alisveriApp
//
//  Created by Eyüphan Akkaya on 20.07.2023.
//

import SwiftUI
import Lottie

struct SplashScreen: View {
    var fileNames = "launchScreen"
    var animation = LottieAnimationView()
    @State var isActive = false
    var name = "launchScreen"
    var body: some View {
        if isActive {
            ContentView()
        } else {
                VStack {
    //                Image(systemName: "heart")
                    LottieView(filename: name)
                        .frame(width: 400,height: 250,alignment: .center)
                        .offset(x: -90,y: -100)
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
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
