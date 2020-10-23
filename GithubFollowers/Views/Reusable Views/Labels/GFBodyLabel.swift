//
//  GFBodyLabel.swift
//  GithubFollowers
//
//  Created by Ahmed Sayed Fathi on 10/3/20.
//  Copyright © 2020 Ahmed Sayed Fathi. All rights reserved.
//

import UIKit

class GFBodyLabel: UILabel {

    ///Default Initialzer
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    ///Stroyboard Handling
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    ///Custom Initializer
    init(textAlignment: NSTextAlignment) {
        super.init(frame: .zero)
        self.textAlignment = textAlignment
        configure()
    }
    
    
    ///Configure Body Label Style
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        textColor = .secondaryLabel
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.65
        lineBreakMode = .byWordWrapping
        numberOfLines = 0
    }
}
