//
//  GFTitleLabel.swift
//  GithubFollowers
//
//  Created by Ahmed Sayed Fathi on 10/3/20.
//  Copyright © 2020 Ahmed Sayed Fathi. All rights reserved.
//

import UIKit

class GFTitleLabel: UILabel {

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
    init(textSize: CGFloat, textAlignment: NSTextAlignment) {
        super.init(frame: .zero)
        self.textAlignment = textAlignment
        self.font = UIFont.systemFont(ofSize: textSize, weight: .bold)
        configure()
    }
    
    
    ///Configure Title Label Style
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        textColor = .label
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.8
        lineBreakMode = .byTruncatingTail
    }
}
