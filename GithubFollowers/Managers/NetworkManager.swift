//
//  NetworkManager.swift
//  GithubFollowers
//
//  Created by Ahmed Sayed Fathi on 10/6/20.
//  Copyright © 2020 Ahmed Sayed Fathi. All rights reserved.
//

import UIKit
class NetworkManager {
    
    //MARK:- Initializers
    private init() {}
    
    //MARK:- Properties
    static var shared   = NetworkManager()
    private var baseURL = "https://api.github.com/"
    let cache           = NSCache<NSString, UIImage>()
    
    //MARK:- Behaviors
    func getFollowers(for username: String, page: Int, completion: @escaping(Result<[Follower], GFError>) -> Void) {
        
        let urlString = baseURL + "users/\(username)/followers?per_page=50&page=\(page)"
        
        guard let url = URL(string: urlString) else {
            completion(.failure(.invalidUsername))
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        
        let getFollowersTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            
            if let _ = error {
                completion(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            do {
                let jsonDecoder = JSONDecoder()
                jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                let followersList = try jsonDecoder.decode([Follower].self, from: data)
                completion(.success(followersList))
            } catch {
                completion(.failure(.invalidData))
            }
        }
        getFollowersTask.resume()
    }
    
    
    func getUserInfo(username: String, completion: @escaping(Result<User, GFError>) -> Void) {
        let urlString = baseURL + "users/\(username)"
        
        guard let url = URL(string: urlString) else {
            completion(.failure(.invalidUsername))
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        
        let getUserInfoTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if error != nil {
                completion(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200  else {
                completion(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let userInfo = try decoder.decode(User.self, from: data)
                completion(.success(userInfo))
            } catch {
                completion(.failure(.invalidData))
            }
        }
        getUserInfoTask.resume()
    }
}
