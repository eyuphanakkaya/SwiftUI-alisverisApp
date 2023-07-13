//
//  ButtonComp.swift
//  alisveriApp
//
//  Created by Eyüphan Akkaya on 12.07.2023.
//

import Foundation
import SwiftUI

class Button{
    func button() {
        Button(action: {
            print("Sepete eklendi")
        }) {
            HStack {
                Text("Add Bag")
                Image(systemName: "bag")
            }
                
        }
    }
}
