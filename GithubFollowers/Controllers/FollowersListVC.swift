//
//  FollowersListVC.swift
//  GithubFollowers
//
//  Created by Ahmed Sayed Fathi on 10/3/20.
//  Copyright © 2020 Ahmed Sayed Fathi. All rights reserved.
//

import UIKit

class FollowersListVC: UIViewController {

    //MARK:- UI Objects
    var followersCollectionView : UICollectionView!
    
    
    //MARK:- Properties
    enum CollectionViewSection {
        case main
    }
    var currentPage = 1
    var username = String()
    var followersList = [Follower]()
    var filteredFollowers = [Follower]()
    var hasMoreFollowers = true
    var isSearching = false
    var diffableDataSource: UICollectionViewDiffableDataSource<CollectionViewSection, Follower>!
    
    
    //MARK:- View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        configureSearchController()
        configureCollectionView()
        getFollowersList(pageNumber: currentPage)
        configureDatasource()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureNavigationController()
    }
    
    
    //MARK:- Actions
    func getFollowersList(pageNumber: Int) {
        let activityIndicatorView = UIHelper.presentActivityViewOnMainThread(on: self)
        NetworkManager.shared.getFollowers(for: username, page: pageNumber) { [weak self] result in
            guard let self = self else {return}
            
            switch result {
            case .failure(let error):
                self.presentGFAlertOnMainThread(title: "Warnning", message: error.rawValue, actionButtonTitle: "OK")
                
            case .success(let followers):
                if followers.count < 50 {self.hasMoreFollowers = false}
                followers.forEach { (follower) in
                    self.followersList.append(follower)
                    self.updateCollectionViewData(with: self.followersList)
                }
                DispatchQueue.main.async {
                    if self.followersList.isEmpty {
                        self.addEmptyStateView(with: "Unfortunately, This user has no followers yet 😞.", on: self.view)
                        return
                    }
                }
            }
            UIHelper.removeActivityIndicator(activityIndicatorView: activityIndicatorView)
        }
    }
    
    
    func configureViewController() {
        self.view.backgroundColor = .systemBackground
    }
    
    
    func configureNavigationController() {
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.tintColor = .systemGreen
    }
    
    
    func configureSearchController() {
        let searchController = UISearchController()
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchController.searchBar.placeholder = "Enter a username"
        navigationItem.searchController = searchController
    }
    
    func configureCollectionView() {
        followersCollectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: UIHelper.createThreeHorizontalColumnsFlowLayout(in: self.view))
        self.view.addSubview(followersCollectionView)
        followersCollectionView.backgroundColor = .systemBackground
        followersCollectionView.delegate = self
        followersCollectionView.register(GFFollowerCell.self, forCellWithReuseIdentifier: GFFollowerCell.reuseID)
    }
    
    
    func configureDatasource() {
        diffableDataSource = UICollectionViewDiffableDataSource<CollectionViewSection, Follower>(collectionView: followersCollectionView, cellProvider: { (collectionView, indexPath, follower) -> UICollectionViewCell? in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GFFollowerCell.reuseID, for: indexPath) as! GFFollowerCell
            cell.set(follower: self.followersList[indexPath.row])
            return cell
        })
    }
    
    
    func updateCollectionViewData(with followers: [Follower]) {
        var snapShot = NSDiffableDataSourceSnapshot<CollectionViewSection, Follower>()
        snapShot.appendSections([.main])
        snapShot.appendItems(followers)
        DispatchQueue.main.async {
            self.diffableDataSource.apply(snapShot, animatingDifferences: true, completion: nil)
        }
    }
}


//MARK:- UICollectionViewDelegate
extension FollowersListVC: UICollectionViewDelegate {
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let height = scrollView.frame.size.height
        if offsetY > contentHeight - height {
            guard hasMoreFollowers else {return}
            currentPage += 1
            getFollowersList(pageNumber: currentPage)
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let activeArray = isSearching ? filteredFollowers : followersList
        let follower = activeArray[indexPath.item]
        let userInfoVC = UserInfoVC()
        userInfoVC.username = follower.login
        let navigationVC = UINavigationController(rootViewController: userInfoVC)
        self.present(navigationVC, animated: true)
    }
}


//MARK:- UISearchController Delegate
extension FollowersListVC: UISearchResultsUpdating, UISearchBarDelegate {
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchKey = searchController.searchBar.text, !searchKey.isEmpty else {return}
        isSearching = true
        filteredFollowers = followersList.filter {$0.login.lowercased().contains(searchKey.lowercased())}
        updateCollectionViewData(with: filteredFollowers)
    }
    
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        isSearching = false
        updateCollectionViewData(with: followersList)
    }
}
