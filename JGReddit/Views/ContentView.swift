//
//  ContentView.swift
//  JGReddit
//
//  Created by Jiaming Guo on 2023-08-26.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = AppStartupViewModel()
    
    var body: some View {
        if viewModel.isLoading {
            StartupView(status: .loading)
                .onAppear {
                    viewModel.getAccessToken()
                }
        } else {
            if viewModel.accessTokenFailed {
                Text("Failed to obtain access token.")
            } else {
                Text("Hello world")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
