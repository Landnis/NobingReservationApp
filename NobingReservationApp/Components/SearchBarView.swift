//
//  SearchBarView.swift
//  NobingReservationApp
//
//  Created by Konstantinos Stergiannis on 28/9/22.
//

import UIKit
import MaterialComponents

class SearchBarView: UIViewController {
    
    var filtered:[String] = []
    var searchActive : Bool = false
    var  collectionView : UICollectionView!
    lazy var searchController = UISearchController(searchResultsController: nil)
    var items = ["Apple", "Orange", "Apple", "Orange", "Apple", "Orange", "Apple", "Orange", "Apple", "Orange", "Apple", "Orange"]
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        view.addSubview(topbar)
        view.addSubview(searchController.searchBar)
        addSearchViewExampleConstraints()
    }
    override func didReceiveMemoryWarning() {
           super.didReceiveMemoryWarning()
       }
    
    lazy var topbar: TopBarView = {
        let topbar = TopBarView()
        topbar.translatesAutoresizingMaskIntoConstraints = false
        return topbar
    }()
    
    func addSearchViewExampleConstraints() {
        topbar.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        topbar.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        topbar.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        topbar.heightAnchor.constraint(equalToConstant: 100 ).isActive = true
        
        searchController.searchBar.topAnchor.constraint(equalTo: topbar.bottomAnchor,constant: 10).isActive = true
        searchController.searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        searchController.searchBar.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
    }
}


