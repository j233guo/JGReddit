//
//  ContentView.swift
//  JGReddit
//
//  Created by Jiaming Guo on 2023-08-26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button("check access") {
                let result = NetworkManager.shared.obtainAccessToken()
                print(result)
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
