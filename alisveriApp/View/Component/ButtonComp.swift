//
//  ButtonComp.swift
//  alisveriApp
//
//  Created by Eyüphan Akkaya on 18.07.2023.
//

import SwiftUI

struct ButtonComp: View {
    var text: Text
    var image: Image
    var action:
    var body: some View {
        Button(action: {
            print("Sepete eklendi")
        }) {
            HStack {
                Text("Add Bag")
                Image(systemName: "bag")
            }
            
        }
        .frame(width: 350,height: 60)
        .background(Color.black)
        .foregroundColor(.white)
        .cornerRadius(20)
    }
}

struct ButtonComp_Previews: PreviewProvider {
    static var previews: some View {
        ButtonComp()
    }
}
