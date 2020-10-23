//
//  GFEmptyStateView.swift
//  GithubFollowers
//
//  Created by Ahmed Sayed Fathi on 10/13/20.
//  Copyright © 2020 Ahmed Sayed Fathi. All rights reserved.
//

import UIKit

class GFEmptyStateView: UIView {

    //MARK:- UI Objects
    var messageLabel = GFTitleLabel(textSize: 25, textAlignment: .center)
    var imageView = UIImageView()
    
    
    //MARK:- Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    init(messeage: String) {
        super.init(frame: .zero)
        messageLabel.text = messeage
        configure()
    }
    
    
    //MARK:- Behaviors
    private func configure() {
        self.addSubview(messageLabel)
        self.addSubview(imageView)
        
        messageLabel.numberOfLines = 0
        messageLabel.textColor = .secondaryLabel
        imageView.image = UIImage(named: "empty-state-logo")!
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            messageLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -200),
            messageLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            messageLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            messageLabel.heightAnchor.constraint(equalToConstant: 200),
            
            imageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1.3),
            imageView.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1.3),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 200),
            imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 20)
        ])
    }
}
