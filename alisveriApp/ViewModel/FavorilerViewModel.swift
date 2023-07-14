//
//  FavorilerViewModel.swift
//  alisveriApp
//
//  Created by Eyüphan Akkaya on 8.07.2023.
//

import Foundation
import SwiftUI

class FavorilerViewModel: ObservableObject {
    @Published var urunList = [Product]()
}
