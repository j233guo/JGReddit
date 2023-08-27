//
//  JGRedditApp.swift
//  JGReddit
//
//  Created by Jiaming Guo on 2023-08-26.
//

import SwiftUI

@main
struct JGRedditApp: App {
    @StateObject private var startupViewModel = AppStartupViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(startupViewModel)
        }
    }
}
