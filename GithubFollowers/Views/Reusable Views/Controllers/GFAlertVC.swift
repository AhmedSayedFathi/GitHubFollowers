//
//  GFAlertVC.swift
//  GithubFollowers
//
//  Created by Ahmed Sayed Fathi on 10/3/20.
//  Copyright © 2020 Ahmed Sayed Fathi. All rights reserved.
//

import UIKit

class GFAlertVC: UIViewController {

    //MARK:- UI Objects
    let containerView = UIView()
    let titleLabel    = GFTitleLabel(textSize: 18, textAlignment: .center)
    let bodyLabel     = GFBodyLabel(textAlignment: .center)
    let actionButton  = GFButton(backgroundColor: .systemPink, title: "OK")
    
    //MARK:- View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureContainerView()
        configureTitleLabel()
        configureActionButton()
        configureBodyLabel()
    }
    
    
    //MARK:- Actions

    ///Initializers
    init(title:String, message:String, actionButtonTitle: String) {
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.85)
        modalTransitionStyle = .crossDissolve
        modalPresentationStyle = .overFullScreen
        titleLabel.text = title
        bodyLabel.text = message
        actionButton.setTitle(actionButtonTitle, for: .normal)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    @objc func dismissAlert() {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    fileprivate func configureContainerView() {
        self.view.addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.layer.borderWidth = 2
        containerView.layer.borderColor = UIColor.white.cgColor
        containerView.layer.cornerRadius = 15
        containerView.backgroundColor = .systemBackground
        
        NSLayoutConstraint.activate([
            containerView.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor),
            containerView.widthAnchor.constraint(equalToConstant: 280),
            containerView.heightAnchor.constraint(equalToConstant: 220)
        ])
    }
    
       
    fileprivate func configureTitleLabel() {
        containerView.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            titleLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    
    fileprivate func configureActionButton() {
        self.containerView.addSubview(actionButton)
        actionButton.addTarget(self, action: #selector(dismissAlert), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            actionButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20),
            actionButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            actionButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            actionButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    
    fileprivate func configureBodyLabel() {
        self.containerView.addSubview(bodyLabel)
        
        NSLayoutConstraint.activate([
            bodyLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            bodyLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            bodyLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            bodyLabel.bottomAnchor.constraint(equalTo: actionButton.topAnchor, constant: -10)
        ])
    }
}
