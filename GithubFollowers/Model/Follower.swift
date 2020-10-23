//
//  Follower.swift
//  GithubFollowers
//
//  Created by Ahmed Sayed Fathi on 10/4/20.
//  Copyright © 2020 Ahmed Sayed Fathi. All rights reserved.
//

struct Follower: Codable, Hashable {
    var login: String
    var avatarUrl: String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(login)
    }
}
