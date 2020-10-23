//
//  SearchVCViewController.swift
//  GithubFollowers
//
//  Created by Ahmed Sayed Fathi on 9/14/20.
//  Copyright © 2020 Ahmed Sayed Fathi. All rights reserved.
//

import UIKit

class SearchVC: UIViewController {

    //MARK:- UI Objects
    let logoImageView = UIImageView()
    let searchTextField = GFTextField(placeholder: "Enter Username")
    let getFollowersButton = GFButton(backgroundColor: .systemGreen, title: "Get Followers")

    
    //MARK:- Properties
    var isSearchTextFieldEmpty: Bool {
        return searchTextField.text!.isEmpty
    }

    
    //MARK:- View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        configureLogoImageView()
        configureSearchTextField()
        configureGetFollowersButton()
        dismissKeyboardTapGesture()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    
    
    //MARK:- Actions
    
    fileprivate func dismissKeyboardTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    
    @objc func getFollowersListVC() {
        guard !isSearchTextFieldEmpty else {
            let alert = GFAlertVC(title: "Warnning", message: "Please enter a username to continue", actionButtonTitle: "OK")
            self.present(alert, animated: true, completion: nil)
            return
        }
        let followersListVC = FollowersListVC()
        followersListVC.username = searchTextField.text!
        followersListVC.title = searchTextField.text!
        navigationController?.pushViewController(followersListVC, animated: true)
    }
    
    
    //MARK:- Configure UI Constraints
    fileprivate func configureLogoImageView() {
        self.view.addSubview(logoImageView)
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.image = UIImage(named: "gh-logo")
        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 50),
            logoImageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 200),
            logoImageView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    
    fileprivate func configureSearchTextField() {
        self.view.addSubview(searchTextField)
        searchTextField.delegate = self
    
        NSLayoutConstraint.activate([
            searchTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 50),
            searchTextField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 50),
            searchTextField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -50),
            searchTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    
    fileprivate func configureGetFollowersButton() {
        self.view.addSubview(getFollowersButton)
        getFollowersButton.addTarget(self, action: #selector(getFollowersListVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            getFollowersButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            getFollowersButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 50),
            getFollowersButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -50),
            getFollowersButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}


//MARK:- UITextField Delegate
extension SearchVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        getFollowersListVC()
        return true
    }
}
