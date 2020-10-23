//
//  GFAvatarImageView.swift
//  GithubFollowers
//
//  Created by Ahmed Sayed Fathi on 10/6/20.
//  Copyright © 2020 Ahmed Sayed Fathi. All rights reserved.
//

import UIKit

class GFAvatarImageView: UIImageView {

    //MARK:- Properties
    let placeholderImage = UIImage(named: "avatar-placeholder")!    
    
    //MARK:- Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
  
    //MARK:- Behaviors
    fileprivate func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 10
        clipsToBounds = true
        image = placeholderImage
    }
    
    
    func downloadImageFrom(imgURLString: String) {
        let cacheKey = NSString(string: imgURLString)
        if let image = NetworkManager.shared.cache.object(forKey: cacheKey) {
            self.image = image
            return
        }
        guard let imgURL = URL(string: imgURLString) else {return}
        let downloadImageTask = URLSession.shared.dataTask(with: imgURL) { [weak self] data, response, error in
            guard let self = self else {return}
            
            if error != nil {return}
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {return}
            guard let data = data else {return}
            guard let image = UIImage(data: data) else {return}
            
            NetworkManager.shared.cache.setObject(image, forKey: cacheKey)
            DispatchQueue.main.async {
                self.image = image
            }
        }
        downloadImageTask.resume()
    }
}
