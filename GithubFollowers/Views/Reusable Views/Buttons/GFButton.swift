//
//  GFButton.swift
//  GithubFollowers
//
//  Created by Ahmed Sayed Fathi on 9/14/20.
//  Copyright © 2020 Ahmed Sayed Fathi. All rights reserved.
//

import UIKit

class GFButton: UIButton {
    
    //MARK:- Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    init(backgroundColor: UIColor, title: String) {
        super.init(frame: .zero)
        self.backgroundColor = backgroundColor
        self.setTitle(title, for: .normal)
        configure()
    }
        
    
    //MARK:- Actions
    private func configure() {
        layer.cornerRadius = 10
        titleLabel?.textColor = .white
        titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        translatesAutoresizingMaskIntoConstraints = false
    }
}
