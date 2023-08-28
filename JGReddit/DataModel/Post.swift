//
//  Post.swift
//  JGReddit
//
//  Created by Jiaming Guo on 2023-08-27.
//

import Foundation

struct PostParameter {
    let subreddit: String
    let listingOption: String
    let limit: Int
    let before: String
    let after: String
}

struct Post: Codable {
    let id: String?
    let author: String?
    let created_utc: Int?
    let media: String?
    let name: String?
    let num_comments: Int?
    let permalink: String?
    let preview: String?
    let score: Int?
    let selftext: String?
    let selftext_html: String?
    let subreddit: String?
    let thumbnail: String?
    let title: String?
    let url: String?
    
    init(from dictionary: [String: Any]) {
        self.id = dictionary["id"] as? String
        self.author = dictionary["author"] as? String ?? "[deleted]"
        self.created_utc = dictionary["created_utc"] as? Int ?? 0
        self.media = dictionary["media"] as? String
        self.name = dictionary["name"] as? String
        self.num_comments = dictionary["num_comments"] as? Int
        self.permalink = dictionary["permalink"] as? String
        self.preview = dictionary["preview"] as? String
        self.score = dictionary["score"] as? Int
        self.selftext = dictionary["selftext"] as? String ?? ""
        self.selftext_html = dictionary["selftext_html"] as? String ?? ""
        self.subreddit = dictionary["subreddit"] as? String
        self.thumbnail = dictionary["thumbnail"] as? String
        self.title = dictionary["title"] as? String
        self.url = dictionary["url"] as? String
    }
}
