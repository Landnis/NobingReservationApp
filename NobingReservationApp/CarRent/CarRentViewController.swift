//
//  CarRentViewController.swift
//  NobingReservationApp
//
//  Created by Konstantinos Stergiannis on 3/8/22.
//

import UIKit
import MaterialComponents.MDCActionSheetController
import MaterialComponents.MDCActionSheetController_MaterialTheming
import SideMenu
class CarRentViewController: UIViewController {

    private var collectionView: UICollectionView?
    var refreshControl = UIRefreshControl()
    var searchController = UISearchController(searchResultsController: nil)
    var tableFilterData = [String]()
    var isSearching = false
    var searchedLocation = carRentalData
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor().hexStringToUIColor(hex: "#f5ebe0")
        view.addSubview(topbar)
        topbar.delegate = self
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        collectionView = UICollectionView(frame: .zero,collectionViewLayout: layout)
        guard let collectionView = collectionView else {
            return
        }
        collectionView.register(CarRentCardsView.self, forCellWithReuseIdentifier: "cell")
        layout.itemSize = CGSize(width: view.frame.size.width-40.0, height: 500)
        layout.minimumInteritemSpacing = 60
        layout.minimumLineSpacing = 60
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor().hexStringToUIColor(hex: "#f5ebe0")
        collectionView.frame = view.bounds
        self.view.addSubview(collectionView)
        view.addSubview(searchBarView)
        searchBarView.addSubview(searchController.searchBar)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        refreshControl.addTarget(self, action: #selector(refresh), for: UIControl.Event.valueChanged)
        collectionView.addSubview(refreshControl)
        constraint()
        configureSearchController()
    }
    
    @objc func refresh(send: UIRefreshControl){
        DispatchQueue.main.asyncAfter(deadline: .now()+2) {
            self.collectionView?.reloadData()
            self.refreshControl.endRefreshing()
        }
    }
    
    lazy var topbar: TopBarView = {
         let topbar = TopBarView()
         topbar.translatesAutoresizingMaskIntoConstraints = false
         return topbar
     }()
    var searchBarView: UIView = {
        let view = UIView(frame:.zero)
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 40).isActive = true
        return view
    }()
    
    private func configureSearchController(){
        searchController.loadViewIfNeeded()
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.enablesReturnKeyAutomatically = false
        searchController.searchBar.returnKeyType = UIReturnKeyType.done
        self.navigationItem.searchController = searchController
        self.navigationItem.hidesSearchBarWhenScrolling = false
        definesPresentationContext = true
        searchController.searchBar.placeholder = "Search Museums By Location"
    }
    
    func constraint(){
      topbar.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
      topbar.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
      topbar.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
      topbar.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        searchBarView.topAnchor.constraint(equalTo: topbar.bottomAnchor,constant: 15).isActive = true
        searchBarView.widthAnchor.constraint(equalToConstant: view.frame.size.width).isActive = true
        
      collectionView?.topAnchor.constraint(equalTo: searchBarView.bottomAnchor,constant: 15).isActive = true
      collectionView?.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
      collectionView?.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
      collectionView?.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }

}
extension CarRentViewController :TopBarViewDelegate {
    func logoutAlert() {
        let viewController = TabBarController()
        viewController.modalTransitionStyle = .crossDissolve
        viewController.modalPresentationStyle = .fullScreen

        let actionSheet = MDCActionSheetController(title: "Logout",
                                                   message: "Press Here if you want to logout!")
        let actionOne = MDCActionSheetAction(title: "Logout",
                                             image: UIImage(named: "logout_x20"),
                                             handler: { _ in self.present(viewController, animated: true)})
        actionSheet.addAction(actionOne)
        present(actionSheet, animated: true, completion: nil)
    }
    
    func tappedMenu() {
      print("swipe")
    }
}

extension CarRentViewController: UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UISearchResultsUpdating,UISearchControllerDelegate,UISearchBarDelegate  {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if isSearching {
            return searchedLocation.count
        } else {
            return carRentalData.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CarRentCardsView
        let CarRental = carRentalData
        if isSearching{
            cell.configure(label: "\(self.searchedLocation[indexPath.row].title!)")
            cell.configure(with: self.searchedLocation[indexPath.row].image!)
            cell.configure(phoneLabel: ": "+self.searchedLocation[indexPath.row].phone!)
            cell.configure(labelSub:  ": "+self.searchedLocation[indexPath.row].address!)
            cell.configure(priceL: self.searchedLocation[indexPath.row].price! )
            cell.layer.cornerRadius = 15
            cell.delegate = self
        }else {
            cell.configure(label: "\(CarRental[indexPath.row].title!)")
            cell.configure(with: CarRental[indexPath.row].image!)
            cell.configure(phoneLabel: ": "+CarRental[indexPath.row].phone!)
            cell.configure(labelSub:  ": "+CarRental[indexPath.row].address!)
            cell.configure(priceL: CarRental[indexPath.row].price! )
            cell.layer.cornerRadius = 15
            cell.delegate = self
        }

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Select section \(indexPath.section) and row \(indexPath.row)")
        let CarRental = carRentalData
        let vc = CarRentSelectedViewController()
        self.navigationController?.pushViewController(CarRentSelectedViewController(), animated: true)
        self.modalPresentationStyle = .formSheet
        searchController.searchBar.searchTextField.text = ""
        searchController.searchBar.resignFirstResponder()
        if isSearching{
            vc.carRent_title = searchedLocation[indexPath.item].title!
            vc.img.image = CarRental[indexPath.item].image!
            //vc.img.image = Hotels[indexPath.row].images!
            vc.address_title = ": "+searchedLocation[indexPath.item].address!
            vc.phone_label = ": "+searchedLocation[indexPath.item].phone!
            vc.price_label = ": \(searchedLocation[indexPath.item].price!)??? per day"
            present(vc, animated: true)
        }else{
            vc.carRent_title = CarRental[indexPath.item].title!
            vc.img.image = CarRental[indexPath.item].image!
            //vc.img.image = Hotels[indexPath.row].images!
            vc.address_title = ": "+CarRental[indexPath.item].address!
            vc.phone_label = ": "+CarRental[indexPath.item].phone!
            vc.price_label = ": \(CarRental[indexPath.item].price!)??? per day"
            present(vc, animated: true)
        }
    }
    func updateSearchResults(for searchController: UISearchController) {
        let searchText = searchController.searchBar.text!
        if !searchText.isEmpty {
            isSearching = true
            searchedLocation.removeAll()
            for location in carRentalData{
                if location.location!.lowercased().contains(searchText.lowercased())
                {
                        self.searchedLocation.append(location)
                        print(searchedLocation)
                }
            }
        }else{
            isSearching = false
            searchedLocation.removeAll()
            searchedLocation = carRentalData
        }
        self.collectionView!.reloadData()
            
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar){
        isSearching = false
        searchedLocation.removeAll()
        collectionView!.reloadData()
    }
  
}
extension CarRentViewController: CarRentCardsDelegate {
    func carRentCardTapped(title:String,image:UIImage,subTitle:String,phone:String,price:Float) {
        print(title)
        let vc = CarRentSelectedViewController()
        self.navigationController?.pushViewController(vc, animated: true)
        self.modalPresentationStyle = .formSheet
        vc.carRent_title = title
        vc.img.image = image
        vc.address_title = subTitle
        vc.phone_label = phone
        vc.price_label = ": \(price)??? per day"
        present(vc, animated: true)
    }
}
