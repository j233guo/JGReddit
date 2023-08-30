//
//  APIManager.swift
//  JGReddit
//
//  Created by Jiaming Guo on 2023-08-27.
//

import Foundation

class APIManager {
    static let shared = APIManager()
    
    func getPosts(payload: PostParameter, completion: @escaping ([Post]) -> Void) {
        NetworkManager.shared.getPosts(requestJSON: payload) { result in
            switch result {
            case .success(let posts):
                completion(posts)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
