//
//  BotttomBarViewController.swift
//  NobingReservationApp
//
//  Created by Konstantinos Stergiannis on 5/9/22.
//

import UIKit
import MaterialComponents

class BottomBarViewController: UIViewController {

    var selectedVC: UIViewController?
    
    lazy var homeVC: HomeViewController = {
        let vc = HomeViewController()
        vc.view.translatesAutoresizingMaskIntoConstraints = false
        return vc
    }()
    lazy var hotelsVC: HotelsViewController = {
        let vc = HotelsViewController()
        vc.view.translatesAutoresizingMaskIntoConstraints = false
        return vc
    }()
    lazy var carRentVC: CarRentViewController = {
        let vc = CarRentViewController()
        vc.view.translatesAutoresizingMaskIntoConstraints = false
        return vc
    }()
    lazy var restaurantsVC: RestaurantsViewController = {
        let vc = RestaurantsViewController()
        vc.view.translatesAutoresizingMaskIntoConstraints = false
        return vc
    }()
    lazy var museumsVC: MuseumViewController = {
        let vc = MuseumViewController()
        vc.view.translatesAutoresizingMaskIntoConstraints = false
        return vc
    }()
    lazy var aboutVC: AboutViewController = {
        let vc = AboutViewController()
        vc.view.translatesAutoresizingMaskIntoConstraints = false
        return vc
    }()
    lazy var infoVC: InfoViewController = {
        let vc = InfoViewController()
        vc.view.translatesAutoresizingMaskIntoConstraints = false
        return vc
    }()
    lazy var contactVC: ContactViewController = {
        let vc = ContactViewController()
        vc.view.translatesAutoresizingMaskIntoConstraints = false
        return vc
    }()
    lazy var rootView: BottomBarView = BottomBarView(frame: .zero)

    
    override func loadView() {
        view = rootView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
       // self.rootView.bottomNavigationBar.backgroundColor = UIColor().hexStringToUIColor(hex: "#f5ebe0")
        setup()
        add(child:homeVC)
        // Do any additional setup after loading the view.
    }
    func add(child:UIViewController){
        addChild(child)
        rootView.addAndConstraintContainedSubview(child.view)
        child.didMove(toParent: self)
    }
    func remove(child:UIViewController){
        child.willMove(toParent: nil)
        child.view.removeFromSuperview()
        child.removeFromParent()
    }
    func setup(){
        let home = UITabBarItem(title: "Home", image: UIImage(named: "home_x20")?.withRenderingMode(.alwaysTemplate), tag: 0)
        let hotels = UITabBarItem(title: "Hotel", image: UIImage(named: "hotel_x20")?.withRenderingMode(.alwaysTemplate), tag: 1)
        let cars = UITabBarItem(title: "CarRental", image: UIImage(named: "car_x20")?.withRenderingMode(.alwaysTemplate), tag: 2)
        let restaurants = UITabBarItem(title: "Restaurant", image: UIImage(named: "restaurant_x20")?.withRenderingMode(.alwaysTemplate), tag: 3)
        let museums = UITabBarItem(title: "Museum", image: UIImage(named: "museum_x20")?.withRenderingMode(.alwaysTemplate), tag: 4)
        let more = UITabBarItem(title: "More", image: UIImage(named: "more_x20")?.withRenderingMode(.alwaysOriginal), tag: 5)


        rootView.bottomNavigationBar.items = [home,hotels,cars,restaurants,museums,more]
        rootView.bottomNavigationBar.selectedItem = rootView.bottomNavigationBar.items.first
        rootView.bottomNavigationBar.delegate = self
    }
}
extension BottomBarViewController : MDCBottomNavigationBarDelegate {
    func bottomNavigationBar(_ bottomNavigationBar: MDCBottomNavigationBar, didSelect item: UITabBarItem) {
        let vc: UIViewController

        switch item.tag {
        case 0:
            vc = homeVC
        case 1:
            vc = hotelsVC
        case 2:
            vc = carRentVC
        case 3:
            vc = restaurantsVC
        case 4:
            if let selectedVC = selectedVC {
                vc = selectedVC
            } else {
                vc = museumsVC
            }
        case 5:
            let museumAction = MDCActionSheetAction(title: "Museums", image: UIImage(named: "museum_x20")){
                _ in
                let museumTabBarItem = UITabBarItem(title: "Museums", image: UIImage(named: "museum_x20"), tag: 4)
                let index = self.rootView.bottomNavigationBar.items.count-2
                self.rootView.bottomNavigationBar.items[index] = museumTabBarItem
                self.rootView.bottomNavigationBar.selectedItem = museumTabBarItem
                
                let vc = self.museumsVC
                self.selectedVC = vc
                
                if let last = self.children.last {
                    self.remove(child: last)
                }
                self.add(child: vc)
            }
            let aboutAction = MDCActionSheetAction(title: "About", image: UIImage(named: "contact_x20")){
                _ in
                let aboutTapBatItem = UITabBarItem(title: "About", image: UIImage(named: "contact_x20"), tag: 4)
                let index = self.rootView.bottomNavigationBar.items.count-2
                self.rootView.bottomNavigationBar.items[index] = aboutTapBatItem
                self.rootView.bottomNavigationBar.selectedItem = aboutTapBatItem
                let vc = self.aboutVC
                self.selectedVC = vc
                if let last = self.children.last {
                    self.remove(child: last)
                }
                self.add(child: vc)
            }
            let infoAction = MDCActionSheetAction(title: "Info", image: UIImage(named: "info_x20")){
                _ in
                let infoTabBarItem = UITabBarItem(title: "Info", image: UIImage(named: "info_x20"), tag: 4)
                let index = self.rootView.bottomNavigationBar.items.count-2
                self.rootView.bottomNavigationBar.items[index] = infoTabBarItem
                self.rootView.bottomNavigationBar.selectedItem = infoTabBarItem
                let vc = self.infoVC
                self.selectedVC = vc
                if let last = self.children.last {
                    self.remove(child: last)
                }
                self.add(child: vc)
            }
            let contactAction = MDCActionSheetAction(title: "Contact", image: UIImage(named: "email_x20")){
                _ in
                let contactTabBarItem = UITabBarItem(title: "Contact", image: UIImage(named: "email_x20"), tag: 4)
                let index = self.rootView.bottomNavigationBar.items.count-2
                self.rootView.bottomNavigationBar.items[index] = contactTabBarItem
                self.rootView.bottomNavigationBar.selectedItem = contactTabBarItem
                let vc = self.contactVC
                self.selectedVC = vc
                if let last = self.children.last {
                    self.remove(child: last)
                }
                self.add(child: vc)
            }
            
            
            let actionSheet = MDCActionSheetController()
            let containerScheme = MDCContainerScheme()
            actionSheet.applyTheme(withScheme: containerScheme)
            actionSheet.addAction(aboutAction)
            actionSheet.addAction(infoAction)
            actionSheet.addAction(museumAction)
            actionSheet.addAction(contactAction)
            self.present(actionSheet, animated: true, completion: nil)
            return
        default:
            fatalError("Bottom navigation item not implement")
        }
        if let last = children.last {
            remove(child: last)
        }
        add(child: vc)
    }
    func bottomNavigationBar(_ bottomNavigationBar: MDCBottomNavigationBar, shouldSelect item: UITabBarItem) -> Bool {
        return bottomNavigationBar.selectedItem != item
    }
}
