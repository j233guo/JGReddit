//
//  NetworkAPI.swift
//  JGReddit
//
//  Created by Jiaming Guo on 2023-08-26.
//

import Foundation

class Network {
    private var baseUrl = "https://www.reddit.com"
    private var clientId: String
    private var secretKey: String
    private var username: String
    private var password: String
    
    init() {
        clientId = credentials.clientId
        secretKey = credentials.secretKey
        username = credentials.username
        password = credentials.password
    }
}
