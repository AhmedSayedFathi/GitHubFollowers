//
//  GFTextField.swift
//  GithubFollowers
//
//  Created by Ahmed Sayed Fathi on 9/14/20.
//  Copyright © 2020 Ahmed Sayed Fathi. All rights reserved.
//

import UIKit

class GFTextField: UITextField {
    
    /// Default Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
       
    
    ///Storyboard Handle
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    ///Custom Initialzier
    init(placeholder: String) {
        super.init(frame: .zero)
        self.placeholder = placeholder
        configure()
    }
    
    
    ///Configure TextField Style
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemBackground
        layer.cornerRadius = 10
        layer.borderWidth = 1
        layer.borderColor = UIColor.systemGray.cgColor
        textAlignment = .center
        font = UIFont.preferredFont(forTextStyle: .title2)
        textColor = .label
        tintColor = .label
        adjustsFontSizeToFitWidth = true
        minimumFontSize = 12
        autocorrectionType = .no
        autocapitalizationType = .none
        returnKeyType = .continue
    }
}
