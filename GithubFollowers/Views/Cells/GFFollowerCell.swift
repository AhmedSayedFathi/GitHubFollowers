//
//  GFFollowerCell.swift
//  GithubFollowers
//
//  Created by Ahmed Sayed Fathi on 10/6/20.
//  Copyright © 2020 Ahmed Sayed Fathi. All rights reserved.
//

import UIKit

class GFFollowerCell: UICollectionViewCell {
    
    //MARK:- UI Objects
    let avatarImageView  = GFAvatarImageView(frame: .zero)
    let usernameLabel    = GFTitleLabel(textSize: 16, textAlignment: .center)
    
    //MARK:- Properties
    static let reuseID   = "FollowerCell"
    let padding: CGFloat = 10
    
    //MARK:- Initialzers
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK:- Behaviors
    func set(follower: Follower) {
        usernameLabel.text = follower.login
        avatarImageView.downloadImageFrom(imgURLString: follower.avatarUrl)
    }
    
    
    fileprivate func configure() {
        layoutAvatarImageView()
        layoutUsernameLabel()
    }
    
    
    fileprivate func layoutAvatarImageView() {
        contentView.addSubview(avatarImageView)
        
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            avatarImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            avatarImageView.heightAnchor.constraint(equalTo: avatarImageView.widthAnchor)
        ])
    }
    
    
    fileprivate func layoutUsernameLabel() {
        contentView.addSubview(usernameLabel)
        
        NSLayoutConstraint.activate([
            usernameLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: padding),
            usernameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            usernameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            usernameLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
}
