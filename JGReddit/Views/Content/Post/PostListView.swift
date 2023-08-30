//
//  PostListView.swift
//  JGReddit
//
//  Created by Jiaming Guo on 2023-08-29.
//

import SwiftUI

struct PostListView: View {
    let posts: [Post]

    var body: some View {
        ScrollView {
            ForEach(posts, id: \.id) { post in
                PostCellView(post: post)
            }
        }
    }
}

struct PostList_Previews: PreviewProvider {
    static var previews: some View {
        let postlist = Array(repeating: Post.example, count: 10)
        PostListView(posts: postlist)
    }
}
