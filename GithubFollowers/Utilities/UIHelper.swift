//
//  UIHelper.swift
//  GithubFollowers
//
//  Created by Ahmed Sayed Fathi on 10/10/20.
//  Copyright © 2020 Ahmed Sayed Fathi. All rights reserved.
//

import UIKit

struct UIHelper {
        
    static func presentActivityViewOnMainThread(on viewController: UIViewController) -> UIView {
        let activityIndicatorView = configureActivityIndicatorView(viewController: viewController)
        DispatchQueue.main.async {
            viewController.view.addSubview(activityIndicatorView)
        }
        return activityIndicatorView
    }
    
    
    static func removeActivityIndicator(activityIndicatorView:UIView) {
        DispatchQueue.main.async {
            activityIndicatorView.removeFromSuperview()
        }
    }
    
    
    static func configureActivityIndicatorView(viewController: UIViewController) -> UIView {
        let activityIndicatorContainerView = UIView(frame: viewController.view.bounds)
        activityIndicatorContainerView.backgroundColor = .systemBackground
        activityIndicatorContainerView.alpha = 0
        UIView.animate(withDuration: 0.25) {
            activityIndicatorContainerView.alpha = 0.75
        }
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicatorContainerView.addSubview(activityIndicator)
        activityIndicator.color = .systemGreen
        activityIndicator.center = activityIndicatorContainerView.center
        activityIndicator.startAnimating()
        return activityIndicatorContainerView
    }
    
    
    static func createThreeHorizontalColumnsFlowLayout(in view: UIView) -> UICollectionViewFlowLayout {
        let width = view.bounds.width
        let padding: CGFloat = 15
        let availbleWidth = width - CGFloat(padding * 4)
        let itemWidth = availbleWidth / 3
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        flowLayout.itemSize = CGSize(width: itemWidth, height: itemWidth + 20)
        return flowLayout
    }
}
