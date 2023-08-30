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
    let created_utc: Double?
    let name: String?
    let num_comments: Int?
    let permalink: String?
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
        self.created_utc = dictionary["created_utc"] as? Double ?? 0
        self.name = dictionary["name"] as? String
        self.num_comments = dictionary["num_comments"] as? Int
        self.permalink = dictionary["permalink"] as? String
        self.score = dictionary["score"] as? Int
        self.selftext = dictionary["selftext"] as? String ?? ""
        self.selftext_html = dictionary["selftext_html"] as? String ?? ""
        self.subreddit = dictionary["subreddit"] as? String
        self.thumbnail = dictionary["thumbnail"] as? String
        self.title = dictionary["title"] as? String
        self.url = dictionary["url"] as? String
    }
    
    var formattedCreationDate: String {
        guard let createdUTC = created_utc else {
            return "Unknown Date"
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = " E MMM d, yyyy, h:mm a"
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        
        let date = Date(timeIntervalSince1970: TimeInterval(createdUTC))
        return dateFormatter.string(from: date)
    }
    
    var selfTextPreview: String {
        var previewText = selftext ?? ""
        previewText = previewText.replacingOccurrences(of: "\n", with: "")
        return previewText
    }
    
    static var example: Post {
        return Post(from: [
            "id": "1647l4t",
            "author": "theloosezeus",
            "created_utc": 1693280858.0,
            "name": "t3_1647l4t",
            "num_comments": 48,
            "permalink": "/r/PersonalFinanceCanada/comments/1647l4t/how_much_should_i_be_investing/",
            "score": 27,
            "selftext": "Hello everyone! \n\nA little bit about me, I am in my late 20s and make about 75k a year. \n\nI paid off my student loans (50k) last year in full and now I wanted to know how much I should be investing. \n\nI have about 20k in savings and 10k currently in investments, I don't have a car and I am renting an apartment. I haven't been able to save as much as this year I moved from the city I lived but hated  to a city I actually like living in. My rent is 1400 dollars all in and I spend about 2300 to 2500 total on expenses (I like to golf). \n\nI am trying to get a gauge on how much I should be investing, I don't want to deprive myself, I prioritize travelling and my leisure time but curious to hear what everyone thinks an accurate amount to invest would be.\n\nIm mostly interested in ETFs, sustainable investments and the occasional roll of the dice in Bitcoin. \n\nThank you!",
            "selftext_html": "&lt;!-- SC_OFF --&gt;&lt;div class=\"md\"&gt;&lt;p&gt;Hello everyone! &lt;/p&gt;\n\n&lt;p&gt;A little bit about me, I am in my late 20s and make about 75k a year. &lt;/p&gt;\n\n&lt;p&gt;I paid off my student loans (50k) last year in full and now I wanted to know how much I should be investing. &lt;/p&gt;\n\n&lt;p&gt;I have about 20k in savings and 10k currently in investments, I don&amp;#39;t have a car and I am renting an apartment. I haven&amp;#39;t been able to save as much as this year I moved from the city I lived but hated  to a city I actually like living in. My rent is 1400 dollars all in and I spend about 2300 to 2500 total on expenses (I like to golf). &lt;/p&gt;\n\n&lt;p&gt;I am trying to get a gauge on how much I should be investing, I don&amp;#39;t want to deprive myself, I prioritize travelling and my leisure time but curious to hear what everyone thinks an accurate amount to invest would be.&lt;/p&gt;\n\n&lt;p&gt;Im mostly interested in ETFs, sustainable investments and the occasional roll of the dice in Bitcoin. &lt;/p&gt;\n\n&lt;p&gt;Thank you!&lt;/p&gt;\n&lt;/div&gt;&lt;!-- SC_ON --&gt;",
            "subreddit": "PersonalFinanceCanada",
            "thumbnail": "",
            "title": "how much should I be investing?",
            "url": "https://www.reddit.com/r/PersonalFinanceCanada/comments/1647l4t/how_much_should_i_be_investing/"
        ])
    }
}
