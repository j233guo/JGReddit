//
//  FeedView.swift
//  JGReddit
//
//  Created by Jiaming Guo on 2023-08-28.
//

import SwiftUI

struct FeedView: View {
    @State private var postlist: [Post] = []
    @State private var category: String = "Home"
    
    let categories = ["Home", "Popular"]
    
    func loadPosts() {
        let payload = PostParameter(subreddit: "all", listingOption: "top", limit: 25, before: "", after: "")
        APIManager.shared.getPosts(payload: payload) { posts in
            postlist.append(contentsOf: posts)
        }
    }
    
    var body: some View {
        NavigationView {
            PostListView(posts: postlist)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("try load") {
                        loadPosts()
                    }
                }
            }
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
