//
//  AccessToken.swift
//  JGReddit
//
//  Created by Jiaming Guo on 2023-08-26.
//

struct AccessToken: Codable {
    var access_token: String
    var token_type: String
    var expires_in: Int
    var scope: String
}
