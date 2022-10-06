//
//  HomeViewController.swift
//  NobingReservationApp
//
//  Created by Konstantinos Stergiannis on 1/8/22.
//

import UIKit
import SideMenu
import MaterialComponents.MDCActionSheetController
import MaterialComponents.MDCActionSheetController_MaterialTheming

/// Data Model for api
//struct Responsed: Codable {
//    let results: MyResults
//    let status: String
//}
//struct MyResults: Codable {
//   let sunrise:String
//   let sunset:String
//   let solar_noon:String
//   let day_length:Int
//   let civil_twilight_begin:String
//   let civil_twilight_end:String
//   let nautical_twilight_begin:String
//   let nautical_twilight_end:String
//   let astronomical_twilight_begin:String
//   let astronomical_twilight_end:String
//}

class HomeViewController: UIViewController{
    
    let datePicker = UIDatePicker()
    var dataSetName = [String]()
    var dataGet = [String]()
    private var collectionView: UICollectionView?
    
    var refreshControl = UIRefreshControl()
    
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
        collectionView.register(HomeView.self, forCellWithReuseIdentifier: "cell")
        collectionView.register(HeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView.identifier)
        collectionView.register(FooterCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: FooterCollectionReusableView.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor().hexStringToUIColor(hex: "#f5ebe0")
        collectionView.frame = view.bounds
        //collectionView.layer.cornerRadius = 15
        self.view.addSubview(collectionView)
        view.addSubview(topbar)
        //view.addSubview(searchTextField)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        refreshControl.addTarget(self, action: #selector(didPullToRefresh), for: UIControl.Event.valueChanged)
        collectionView.addSubview(refreshControl)
        constraint()
        //fetchData()
    }
    
    @objc private func didPullToRefresh() {
         print("Start")
        DispatchQueue.main.async{
             self.collectionView?.refreshControl?.endRefreshing()
         }
     }
     ///  Store the api for weather data
//     private func fetchData(){
//
//         let url = URL(string:"https://api.sunrise-sunset.org/json?lat=36.7201600&lng=-4.4203400&formatted=0")!
//         let task = URLSession.shared.dataTask(with: url)
//         { (data, resp, error) in
//
//             guard let data = data else {
//                 print("data is nil")
//                 return
//             }
//
//             guard let result = try? JSONDecoder().decode(Responsed.self, from: data)else {
//                 print("couldn't")
//                 return
//             }
//             self.dataGet.append(result.results.sunrise)
//             self.dataGet.append(result.results.civil_twilight_begin)
//             self.dataGet.append(result.results.sunset)
//             self.dataGet.append(result.results.civil_twilight_end)
//             DispatchQueue.main.async {
//                 self.collectionView?.reloadData()
//             }
//         }
//         task.resume()
//     }
    
 
    
   lazy var topbar: TopBarView = {
        let topbar = TopBarView()
        topbar.translatesAutoresizingMaskIntoConstraints = false
        return topbar
    }()
    
    func constraint(){
        topbar.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        topbar.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        topbar.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        //topbar.widthAnchor.constraint(equalToConstant: 50).isActive = true
        topbar.heightAnchor.constraint(equalToConstant: 100).isActive = true
    
       collectionView?.topAnchor.constraint(equalTo: topbar.bottomAnchor).isActive = true
       collectionView?.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
       collectionView?.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
       collectionView?.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    

}
extension HomeViewController: TopBarViewDelegate {
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
extension HomeViewController:  UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell",for:indexPath) as! HomeView
        cell.backgroundColor = .cyan
        cell.cityLabel.text = "Thessaloniki"
        cell.imageCard.isHidden = true
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        print("You select an item"+indexPath.description)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader{
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderCollectionReusableView.identifier, for: indexPath) as? HeaderCollectionReusableView else{
                return UICollectionReusableView()
            }
            header.configure(with: true)
            return header
        }
        return collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: FooterCollectionReusableView.identifier, for: indexPath)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 10, bottom: 1, right: 10)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 170, height: 170)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.size.width+100)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 35)
    }
}



///             SideMenu
///
/// insert above viewDidLoad()
//private var sideMenu : SideMenuNavigationController?
//private let infoController = InfoViewController()
//private let hotelsController = HotelsViewController()
//private let museumsController = MuseumViewController()
//private let carController = CarRentViewController()
//private let restaurantController = RestaurantsViewController()
//private let aboutController = AboutViewController()
//private let contactController = ContactViewController()
//private let homeController = HomeViewController()

/// insert IN viewDidLoad()
//        let menu = MenuViewController(with: SideMenuItem.allCases)
//        menu.delegate = self
//        sideMenu = SideMenuNavigationController(rootViewController: menu)
//        sideMenu?.leftSide = true
//        SideMenuManager.default.leftMenuNavigationController = sideMenu
//        SideMenuManager.default.addPanGestureToPresent(toView: view)
//        addChildControllers()

/// insert UNDER viewdidLoad()
//    private func addChildControllers(){
//
//        addChild(infoController)
//        addChild(carController)
//        addChild(museumsController)
//        addChild(restaurantController)
//        addChild(aboutController)
//        addChild(hotelsController)
//        addChild(contactController)
//
//        view.addSubview(infoController.view)
//        view.addSubview(carController.view)
//        view.addSubview(museumsController.view)
//        view.addSubview(restaurantController.view)
//        view.addSubview(aboutController.view)
//        view.addSubview(hotelsController.view)
//        view.addSubview(contactController.view)
//
//        infoController.view.frame = view.bounds
//        carController.view.frame = view.bounds
//        museumsController.view.frame = view.bounds
//        restaurantController.view.frame = view.bounds
//        aboutController.view.frame = view.bounds
//        hotelsController.view.frame = view.bounds
//        contactController.view.frame = view.bounds
//
//        infoController.didMove(toParent: self)
//        carController.didMove(toParent: self)
//        museumsController.didMove(toParent: self)
//        restaurantController.didMove(toParent: self)
//        aboutController.didMove(toParent: self)
//        hotelsController.didMove(toParent: self)
//        contactController.didMove(toParent: self)
//
//        infoController.view.isHidden = true
//        carController.view.isHidden = true
//        museumsController.view.isHidden = true
//        restaurantController.view.isHidden = true
//        aboutController.view.isHidden = true
//        hotelsController.view.isHidden = true
//        contactController.view.isHidden = true
//    }

/// this is the extension of side menu
//extension HomeViewController: MenuControllerDelegate {
//    func didSelectMenuItems(named: SideMenuItem) {
//        sideMenu?.dismiss(animated: true,completion:nil)
//            switch named {
//            case .home:
//                print("Side Menu")
//               infoController.view.isHidden = true
//               carController.view.isHidden = true
//               museumsController.view.isHidden = true
//               restaurantController.view.isHidden = true
//               aboutController.view.isHidden = true
//               hotelsController.view.isHidden = true
//               contactController.view.isHidden = true
//            case .hotels:
//                print("hotels")
//                infoController.view.isHidden = true
//                carController.view.isHidden = true
//                museumsController.view.isHidden = true
//                restaurantController.view.isHidden = true
//                aboutController.view.isHidden = true
//                hotelsController.view.isHidden = false
//                contactController.view.isHidden = true
//            case .carRent:
//                print("Side Menu")
//               infoController.view.isHidden = true
//               carController.view.isHidden = false
//               museumsController.view.isHidden = true
//               restaurantController.view.isHidden = true
//               aboutController.view.isHidden = true
//               hotelsController.view.isHidden = true
//               contactController.view.isHidden = true
//            case .restaurants:
//                print("restaurants")
//               infoController.view.isHidden = true
//               carController.view.isHidden = true
//               museumsController.view.isHidden = true
//               restaurantController.view.isHidden = false
//               aboutController.view.isHidden = true
//               hotelsController.view.isHidden = true
//               contactController.view.isHidden = true
//            case .museums:
//                print("Restaurants")
//               infoController.view.isHidden = true
//               carController.view.isHidden = true
//               museumsController.view.isHidden = false
//               restaurantController.view.isHidden = true
//               aboutController.view.isHidden = true
//               hotelsController.view.isHidden = true
//               contactController.view.isHidden = true
//            case .info:
//                print("Restaurants")
//               infoController.view.isHidden = false
//               carController.view.isHidden = true
//               museumsController.view.isHidden = true
//               restaurantController.view.isHidden = true
//               aboutController.view.isHidden = true
//               hotelsController.view.isHidden = true
//               contactController.view.isHidden = true
//            case .about:
//               infoController.view.isHidden = true
//               carController.view.isHidden = true
//               museumsController.view.isHidden = true
//               restaurantController.view.isHidden = true
//               aboutController.view.isHidden = false
//               hotelsController.view.isHidden = true
//               contactController.view.isHidden = true
//            case .contact:
//               infoController.view.isHidden = true
//               carController.view.isHidden = true
//               museumsController.view.isHidden = true
//               restaurantController.view.isHidden = true
//               aboutController.view.isHidden = false
//               hotelsController.view.isHidden = true
//               contactController.view.isHidden = false
//
//            }
//        }
//}
