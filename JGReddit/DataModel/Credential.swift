//
//  Credential.swift
//  JGReddit
//
//  Created by Jiaming Guo on 2023-08-26.
//

import Foundation

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
        fatalError("Cannot find \(filename) in main bundle.")
    }
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Cannot load \(filename) from main bundle: \(error)")
    }
    do {
        return try JSONDecoder().decode(T.self, from: data)
    } catch {
        fatalError("Cannot parse \(filename) as \(T.self): \(error)")
    }
}

struct Credential: Codable {
    let clientId: String
    let secretKey: String
    let username: String
    let password: String
}

let credential: Credential = load("credentials.json")
