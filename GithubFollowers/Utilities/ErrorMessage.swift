//
//  ErrorMessage.swift
//  GithubFollowers
//
//  Created by Ahmed Sayed Fathi on 10/6/20.
//  Copyright © 2020 Ahmed Sayed Fathi. All rights reserved.
//

import Foundation

enum GFError: String, Error {
    case invalidUsername  = "Invalid username. Please try again later"
    case unableToComplete = "Internet connection is weak or lost. Please try again later."
    case invalidResponse  = "Invalid response from the server. Please try again later."
    case invalidData      = "Invalid data from the server. Please try again later."
}
