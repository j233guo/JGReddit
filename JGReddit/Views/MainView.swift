//
//  MainView.swift
//  JGReddit
//
//  Created by Jiaming Guo on 2023-08-27.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationView {
            TabView {
                FeedView()
                    .tabItem {
                        Label("Feeds", systemImage: "newspaper")
                    }
                SubredditView()
                    .tabItem {
                        Label("Communities", systemImage: "star.bubble")
                    }
            }
        }
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
