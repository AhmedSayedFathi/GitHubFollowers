//
//  User.swift
//  GithubFollowers
//
//  Created by Ahmed Sayed Fathi on 10/4/20.
//  Copyright © 2020 Ahmed Sayed Fathi. All rights reserved.
//

struct User: Codable, Hashable {
    var login: String
    var avatarUrl: String
    var name: String?
    var location: String?
    var bio: String?
    var publicRepos: Int
    var publicGists: Int
    var followers: Int
    var following: Int
    var htmlUrl: String
    var createdAt: String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(login)
    }
}
