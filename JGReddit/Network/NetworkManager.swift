//
//  NetworkManager.swift
//  JGReddit
//
//  Created by Jiaming Guo on 2023-08-26.
//

import Alamofire
import Foundation

enum APIError: Error {
    case invalidURL
    case networkError
    case jsonDecodingError
}

class NetworkManager {
    private var baseUrl = "https://www.reddit.com"
    private var clientId: String
    private var secretKey: String
    private var username: String
    private var password: String
    private var accessToken: String = ""
    private var header: HTTPHeaders = [
        "User-Agent": "swift:journey-grid:v0.0.1 (by /u/anonymousaudience)",
    ]
    
    static let shared = NetworkManager()
    
    init() {
        clientId = credential.clientId
        secretKey = credential.secretKey
        username = credential.username
        password = credential.password
    }
}

extension NetworkManager {
    func checkAccessToken() -> Bool {
        !accessToken.isEmpty
    }
    
    func obtainAccessToken(completion: @escaping (Bool) -> Void) {
        let authData = "\(clientId):\(secretKey)".data(using: .utf8)
        guard let authValue = authData?.base64EncodedString() else {
            return
        }
        self.header["Authorization"] = "Basic \(authValue)"
        let parameters: [String: String] = [
            "grant_type": "password",
            "username": username,
            "password": password
        ]
        AF.request("\(baseUrl)/api/v1/access_token",
                   method: .post,
                   parameters: parameters,
                   encoding: URLEncoding.default,
                   headers: self.header
        ).responseDecodable(of: AccessToken.self) { response in
            switch response.result {
            case .success(let token):
                self.accessToken = token.access_token
                if self.checkAccessToken() {
                    self.baseUrl = "https://oauth.reddit.com/"
                    self.header["Authorization"] = "bearer \(self.accessToken)"
                    completion(true)
                } else {
                    completion(false)
                }
            case .failure:
                completion(false)
            }
        }
    }
    
    func getPosts(requestJSON: PostParameter, completion: @escaping (Result<[Post], APIError>) -> Void) {
        let subreddit = requestJSON.subreddit
        let listingOption = requestJSON.listingOption
        let parameters: Parameters = [
            "limit": requestJSON.limit,
            "before": requestJSON.before,
            "after": requestJSON.after
        ]
        AF.request("\(self.baseUrl)r/\(subreddit)/\(listingOption)",
                   method: .get,
                   parameters: parameters,
                   encoding: URLEncoding.default,
                   headers: self.header
        ).validate().responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    let value = try JSONSerialization.jsonObject(with: data)
                    if let jsonResponse = value as? [String: Any],
                       let data = jsonResponse["data"] as? [String: Any],
                       let children = data["children"] as? [[String:Any]] {
                        let posts = children.compactMap { $0["data"] as? [String: Any] }.map(Post.init)
                        completion(.success(posts))
                    } else {
                        completion(.failure(APIError.jsonDecodingError))
                    }
                } catch {
                    print("Error while decoding response:  from: \(String(describing: String(data: data, encoding: .utf8)))")
                }
            case .failure:
                completion(.failure(APIError.networkError))
            }
        }
    }
}
