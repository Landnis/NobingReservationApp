//
//  SearchViewController.swift
//  NobingReservationApp
//
//  Created by Konstantinos Stergiannis on 6/10/22.
//

import Foundation
import UIKit
import MaterialComponents
class SearchViewController: UIViewController {
    
    private var collectionView: UICollectionView?
    var isSearching = false
    var searchedItem = dataSet
    var itemList = dataSet
    let searchController = UISearchController(searchResultsController: nil)
    
    lazy var searchView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor().hexStringToUIColor(hex: "#f5ebe0")
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        collectionView = UICollectionView(frame: .zero,collectionViewLayout: layout)
        guard let collectionView = collectionView else {
            return
        }
        collectionView.register(MuseumsCardView.self, forCellWithReuseIdentifier: "cell")
        layout.itemSize = CGSize(width: view.frame.size.width-40.0, height: 500)
        layout.minimumInteritemSpacing = 60
        layout.minimumLineSpacing = 60
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor().hexStringToUIColor(hex: "#f5ebe0")
        collectionView.frame = view.bounds
        self.view.addSubview(collectionView)
        self.view.addSubview(searchView)
        searchView.addSubview(searchController.searchBar)
//        view.addSubview(searchTextField)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
       // searchController.searchBar.translatesAutoresizingMaskIntoConstraints = false
        collectionViewConstraints()
        configureSearchController()
    }
   private func configureSearchController(){
        searchController.loadViewIfNeeded()
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.enablesReturnKeyAutomatically = false
        searchController.searchBar.returnKeyType = UIReturnKeyType.done
        self.navigationItem.hidesSearchBarWhenScrolling = true
        self.navigationItem.searchController = searchController
        //self.edgesForExtendedLayout = .top
       definesPresentationContext = true
        searchController.searchBar.placeholder = "Search Museum by Name"
    }
    
    func collectionViewConstraints(){
        
        searchView.topAnchor.constraint(equalTo: view.topAnchor,constant: 50).isActive = true
        searchView.widthAnchor.constraint(equalToConstant: view.frame.size.width).isActive = true
        
        collectionView?.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 50).isActive = true
        collectionView?.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionView?.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        collectionView?.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
    }
    
    
}
extension SearchViewController: UICollectionViewDelegate,UICollectionViewDataSource,UISearchResultsUpdating,UISearchBarDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if isSearching {
            return searchedItem.count
        }else{
            return itemList.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MuseumsCardView
        
        if isSearching{
            cell.configure(label: "\(searchedItem[indexPath.row].title!)")
            cell.configure(with: searchedItem[indexPath.row].image!)
            cell.configure(phoneLabel: ": "+searchedItem[indexPath.row].phone!)
            cell.configure(labelSub:  ": "+searchedItem[indexPath.row].address!)
            cell.configure(priceL: searchedItem[indexPath.row].price! )
            cell.layer.cornerRadius = 15
            
        }else{
            cell.configure(label: "\(itemList[indexPath.row].title!)")
            cell.configure(with: itemList[indexPath.row].image!)
            cell.configure(phoneLabel: ": "+itemList[indexPath.row].phone!)
            cell.configure(labelSub:  ": "+itemList[indexPath.row].address!)
            cell.configure(priceL: itemList[indexPath.row].price! )
            cell.layer.cornerRadius = 15
        }
        return cell
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchText = searchController.searchBar.text!
        if !searchText.isEmpty
        {
            isSearching = true
            searchedItem.removeAll()
            for item in itemList {
                if item.location!.lowercased().contains(searchText.lowercased()){
                    searchedItem.append(item)
                }
            }
        }else {
            isSearching = false
            searchedItem.removeAll()
            searchedItem = itemList
        }
        collectionView!.reloadData()
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        isSearching = false
        searchedItem.removeAll()
        collectionView!.reloadData()
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if isSearching {
            print("You have Clicked on Museum \(searchedItem[indexPath.row].location)")
        }else {
            print("You have Clicked on Museum \(itemList[indexPath.row].location)")
        }
    }
    
}
