//
//  MainView.swift
//  JGReddit
//
//  Created by Jiaming Guo on 2023-08-27.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        Button("try load post") {
            let payload = PostParameter(subreddit: "all", listingOption: "top", limit: 25, before: "", after: "")
            APIManager.shared.getPosts(payload: payload) { posts in
                print(posts)
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
