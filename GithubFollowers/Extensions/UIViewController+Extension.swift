//
//  UIViewController+Extension.swift
//  GithubFollowers
//
//  Created by Ahmed Sayed Fathi on 10/6/20.
//  Copyright © 2020 Ahmed Sayed Fathi. All rights reserved.
//

import UIKit

extension UIViewController {
    func presentGFAlertOnMainThread(title: String, message: String, actionButtonTitle: String) {
        DispatchQueue.main.async {
            let alertVC = GFAlertVC(title: title, message: message, actionButtonTitle: actionButtonTitle)
            self.present(alertVC, animated: true, completion: nil)
        }
    }
    
    func addEmptyStateView(with message: String, on view: UIView) {
        DispatchQueue.main.async {
            let emptyStateView = GFEmptyStateView(messeage: message)
            emptyStateView.frame = view.bounds
            view.addSubview(emptyStateView)
        }
    }
}
