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
class HomeViewController: UIViewController{
    
    private var sideMenu : SideMenuNavigationController?
    private let infoController = InfoViewController()
    private let hotelsController = HotelsViewController()
    private let museumsController = MuseumViewController()
    private let carController = CarRentViewController()
    private let restaurantController = RestaurantsViewController()
    private let aboutController = AboutViewController()
    private let contactController = ContactViewController()
    //private let homeController = HomeViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let menu = MenuViewController(with: SideMenuItem.allCases)
        menu.delegate = self
        sideMenu = SideMenuNavigationController(rootViewController: menu)
        sideMenu?.leftSide = true
        SideMenuManager.default.leftMenuNavigationController = sideMenu
        SideMenuManager.default.addPanGestureToPresent(toView: view)
        view.backgroundColor = .orange
        topbar.delegate = self
        view.addSubview(topbar)
        constraint()
        addChildControllers()
    }
    private func addChildControllers(){

        addChild(infoController)
        addChild(carController)
        addChild(museumsController)
        addChild(restaurantController)
        addChild(aboutController)
        addChild(hotelsController)
        addChild(contactController)
        
        view.addSubview(infoController.view)
        view.addSubview(carController.view)
        view.addSubview(museumsController.view)
        view.addSubview(restaurantController.view)
        view.addSubview(aboutController.view)
        view.addSubview(hotelsController.view)
        view.addSubview(contactController.view)

        infoController.view.frame = view.bounds
        carController.view.frame = view.bounds
        museumsController.view.frame = view.bounds
        restaurantController.view.frame = view.bounds
        aboutController.view.frame = view.bounds
        hotelsController.view.frame = view.bounds
        contactController.view.frame = view.bounds

        infoController.didMove(toParent: self)
        carController.didMove(toParent: self)
        museumsController.didMove(toParent: self)
        restaurantController.didMove(toParent: self)
        aboutController.didMove(toParent: self)
        hotelsController.didMove(toParent: self)
        contactController.didMove(toParent: self)

        infoController.view.isHidden = true
        carController.view.isHidden = true
        museumsController.view.isHidden = true
        restaurantController.view.isHidden = true
        aboutController.view.isHidden = true
        hotelsController.view.isHidden = true
        contactController.view.isHidden = true
    }
    
   lazy var topbar: TopBarView = {
        let topbar = TopBarView()
       // topbar.backgroundColor = .blue
        topbar.translatesAutoresizingMaskIntoConstraints = false
        return topbar
    }()
    
    func constraint(){
      topbar.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
      topbar.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
      topbar.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
      //topbar.widthAnchor.constraint(equalToConstant: 50).isActive = true
      topbar.heightAnchor.constraint(equalToConstant: 100).isActive = true
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

extension HomeViewController: MenuControllerDelegate {
    func didSelectMenuItems(named: SideMenuItem) {
        sideMenu?.dismiss(animated: true,completion:nil)
            switch named {
            case .home:
                print("Side Menu")
               infoController.view.isHidden = true
               carController.view.isHidden = true
               museumsController.view.isHidden = true
               restaurantController.view.isHidden = true
               aboutController.view.isHidden = true
               hotelsController.view.isHidden = true
               contactController.view.isHidden = true
            case .hotels:
                print("hotels")
                infoController.view.isHidden = true
                carController.view.isHidden = true
                museumsController.view.isHidden = true
                restaurantController.view.isHidden = true
                aboutController.view.isHidden = true
                hotelsController.view.isHidden = false
                contactController.view.isHidden = true
            case .carRent:
                print("Side Menu")
               infoController.view.isHidden = true
               carController.view.isHidden = false
               museumsController.view.isHidden = true
               restaurantController.view.isHidden = true
               aboutController.view.isHidden = true
               hotelsController.view.isHidden = true
               contactController.view.isHidden = true
            case .restaurants:
                print("restaurants")
               infoController.view.isHidden = true
               carController.view.isHidden = true
               museumsController.view.isHidden = true
               restaurantController.view.isHidden = false
               aboutController.view.isHidden = true
               hotelsController.view.isHidden = true
               contactController.view.isHidden = true
            case .museums:
                print("Restaurants")
               infoController.view.isHidden = true
               carController.view.isHidden = true
               museumsController.view.isHidden = false
               restaurantController.view.isHidden = true
               aboutController.view.isHidden = true
               hotelsController.view.isHidden = true
               contactController.view.isHidden = true
            case .info:
                print("Restaurants")
               infoController.view.isHidden = false
               carController.view.isHidden = true
               museumsController.view.isHidden = true
               restaurantController.view.isHidden = true
               aboutController.view.isHidden = true
               hotelsController.view.isHidden = true
               contactController.view.isHidden = true
            case .about:
               infoController.view.isHidden = true
               carController.view.isHidden = true
               museumsController.view.isHidden = true
               restaurantController.view.isHidden = true
               aboutController.view.isHidden = false
               hotelsController.view.isHidden = true
               contactController.view.isHidden = true
            case .contact:
               infoController.view.isHidden = true
               carController.view.isHidden = true
               museumsController.view.isHidden = true
               restaurantController.view.isHidden = true
               aboutController.view.isHidden = false
               hotelsController.view.isHidden = true
               contactController.view.isHidden = false

            }
        }
}
