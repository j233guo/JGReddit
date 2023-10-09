//
//  ContentView.swift
//  JGReddit
//
//  Created by Jiaming Guo on 2023-08-26.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var startupViewModel: AppStartupViewModel
    @State private var initScreen = true
    
    var body: some View {
        if initScreen {
            Button {
                initScreen = false
                startupViewModel.getAccessToken()
            } label: {
                Label("Get Access Token", systemImage: "person.badge.key.fill")
            }
            .buttonStyle(.borderedProminent)
        } else {
            if startupViewModel.isLoading {
                StartupView(status: .loading)
            } else {
                if startupViewModel.accessTokenFailed {
                    StartupView(status: .failed)
                } else {
                    MainView()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(startupViewModel: AppStartupViewModel())
    }
}
