//
//  PostCellView.swift
//  JGReddit
//
//  Created by Jiaming Guo on 2023-08-29.
//

import SwiftUI

struct PostCellView: View {
    let post: Post
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("r/\(post.subreddit ?? "")")
                    .font(.system(size: 11))
                Text("\(post.formattedCreationDate)")
                    .font(.system(size: 11))
                Spacer()
            }
            Text("\(post.title ?? "")")
                .font(.headline)
                .padding(.vertical, 1)
            if !post.selfTextPreview.isEmpty {
                Text("\(post.selfTextPreview)")
                    .font(.caption)
                    .lineLimit(3)
            }
        }
        .padding()
        .background(
            Color("postcell_bg")
        )
        .clipShape(RoundedRectangle(cornerRadius: 8.0))
        .shadow(radius: 2)
        .padding(.horizontal, 10)
        
    }
}

struct PostCellView_Previews: PreviewProvider {
    static var previews: some View {
        PostCellView(post: Post.example)
    }
}
