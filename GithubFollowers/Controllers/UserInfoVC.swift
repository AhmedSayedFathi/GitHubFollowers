//
//  UserInfoVC.swift
//  GithubFollowers
//
//  Created by Ahmed Sayed Fathi on 10/15/20.
//  Copyright © 2020 Ahmed Sayed Fathi. All rights reserved.
//

import UIKit

class UserInfoVC: UIViewController {

    //MARK:- UI Objects
    
    
    //MARK:- Properties
    var username: String!
    
    //MARK:- View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationController()
        configureViewController()
    }
    
    
    //MARK:- Actions
    func configureNavigationController() {
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissVC))
        navigationItem.rightBarButtonItem = doneButton
        navigationController?.navigationBar.tintColor = .systemGreen
    }
    
    
    func configureViewController() {
        navigationItem.title = username!
        view.backgroundColor = .systemBackground
    }
    
    @objc func dismissVC() {
        self.dismiss(animated: true)
    }
}
