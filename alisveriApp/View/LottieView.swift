//
//  LottieView.swift
//  alisveriApp
//
//  Created by Eyüphan Akkaya on 21.07.2023.
//

import Foundation
import Lottie
import SwiftUI

struct LottieView: UIViewRepresentable {
    let animationView = LottieAnimationView()
    var filename: String
    
    func makeUIView(context: UIViewRepresentableContext<LottieView>) -> UIView {
        let view = UIView()
        
        let animation = LottieAnimation.named(filename)
        animationView.animation = animation
        animationView.contentMode = .scaleAspectFit
        animationView.play()
        
        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)
        
        NSLayoutConstraint.activate([
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
            animationView.heightAnchor.constraint(equalTo: view.widthAnchor)
        ])
        return view
    }
    func updateUIView(_ uiView: UIView,context: UIViewRepresentableContext<LottieView>) {
        
    }
    
}
