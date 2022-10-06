//
//  HotelsViewController.swift
//  NobingReservationApp
//
//  Created by Konstantinos Stergiannis on 3/8/22.
//

import UIKit
import MaterialComponents
import MaterialComponents.MDCActionSheetController
import MaterialComponents.MDCActionSheetController_MaterialTheming
class HotelsViewController: UIViewController,AlertController {
    
    private var collectionView: UICollectionView?
    var refreshControl = UIRefreshControl()
    var searchController = UISearchController(searchResultsController: nil)
    var tableFilterData = [String]()
    var isSearching = false
    var searchedLocation = hotelData
    
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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        topbar.delegate = self
        view.backgroundColor = UIColor().hexStringToUIColor(hex: "#f5ebe0")
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        collectionView = UICollectionView(frame: .zero,collectionViewLayout: layout)
        guard let collectionView = collectionView else {
            return
        }
        collectionView.register(HotelCardsView.self, forCellWithReuseIdentifier: "cell")
        layout.itemSize = CGSize(width: view.frame.size.width-40.0, height: 500)
        layout.minimumInteritemSpacing = 60
        layout.minimumLineSpacing = 60
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor().hexStringToUIColor(hex: "#f5ebe0")
        collectionView.frame = view.bounds
        self.view.addSubview(collectionView)
        view.addSubview(topbar)
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

extension HotelsViewController: UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UISearchResultsUpdating,UISearchControllerDelegate,UISearchBarDelegate  {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if isSearching {
            return searchedLocation.count
        } else {
            return hotelData.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! HotelCardsView
        let Museums = hotelData
        if isSearching{
            cell.configure(label: "\(self.searchedLocation[indexPath.row].title!)")
            cell.configure(with: self.searchedLocation[indexPath.row].image!)
            cell.configure(phoneLabel: ": "+self.searchedLocation[indexPath.row].phone!)
            cell.configure(labelSub:  ": "+self.searchedLocation[indexPath.row].subTitle!)
            cell.configure(priceL: self.searchedLocation[indexPath.row].price! )
            cell.layer.cornerRadius = 15
            cell.delegate = self
        }else {
            cell.configure(label: "\(Museums[indexPath.row].title!)")
            cell.configure(with: Museums[indexPath.row].image!)
            cell.configure(phoneLabel: ": "+Museums[indexPath.row].phone!)
            cell.configure(labelSub:  ": "+Museums[indexPath.row].subTitle!)
            cell.configure(priceL: Museums[indexPath.row].price! )
            cell.layer.cornerRadius = 15
            cell.delegate = self
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Select section \(indexPath.section) and row \(indexPath.row)")
        let Hotels = hotelData
        let vc = HotelSelectedViewController()
        self.navigationController?.pushViewController(HotelSelectedViewController(), animated: true)
        self.modalPresentationStyle = .formSheet
        searchController.searchBar.searchTextField.text = ""
        searchController.searchBar.resignFirstResponder()
        if isSearching {
            vc.hotel_title = self.searchedLocation[indexPath.item].title!
            vc.img.image = Hotels[indexPath.item].image!
            //vc.img.image = Hotels[indexPath.row].images!
            vc.address_title = ": "+self.searchedLocation[indexPath.item].subTitle!
            vc.phone_label = ": "+self.searchedLocation[indexPath.item].phone!
            vc.price_label = ": \(self.searchedLocation[indexPath.item].price!)€ per day"
            present(vc, animated: true)
        }else {
            vc.hotel_title = Hotels[indexPath.item].title!
            vc.img.image = Hotels[indexPath.item].image!
            //vc.img.image = Hotels[indexPath.row].images!
            vc.address_title = ": "+Hotels[indexPath.item].subTitle!
            vc.phone_label = ": "+Hotels[indexPath.item].phone!
            vc.price_label = ": \(Hotels[indexPath.item].price!)€ per day"
            present(vc, animated: true)
        }
    }
    func updateSearchResults(for searchController: UISearchController) {
        let searchText = searchController.searchBar.text!
        if !searchText.isEmpty {
            isSearching = true
            searchedLocation.removeAll()
            for location in hotelData{
                if location.location!.lowercased().contains(searchText.lowercased())
                {
                        self.searchedLocation.append(location)
                        print(searchedLocation)
                }
            }
        }else{
            isSearching = false
            searchedLocation.removeAll()
            searchedLocation = hotelData
        }
        self.collectionView!.reloadData()
            
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar){
        isSearching = false
        searchedLocation.removeAll()
        collectionView!.reloadData()
    }
  
}

extension HotelsViewController: TopBarViewDelegate {
    func tappedMenu() {
        print("Hello")
    }
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
    
}
extension HotelsViewController: HotelCardsDelegate {
    func hotelCardTapped(title:String,image:UIImage,subTitle:String,phone:String,price:Float) {
        print(title)
        let vc = HotelSelectedViewController()
        self.navigationController?.pushViewController(vc, animated: true)
        self.modalPresentationStyle = .formSheet
        vc.hotel_title = title
        vc.img.image = image
        vc.address_title = subTitle
        vc.phone_label = phone
        vc.price_label = ": \(price)€ per day"
        present(vc, animated: true)
    }


}
