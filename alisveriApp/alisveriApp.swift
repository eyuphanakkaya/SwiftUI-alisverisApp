//
//  alisveriAppApp.swift
//  alisveriApp
//
//  Created by Eyüphan Akkaya on 6.07.2023.
//

import SwiftUI

@main
struct alisveriApp: App {
    @AppStorage("isMode") var isMode = false
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(isMode ? .dark : .light)
        }
    }
}
