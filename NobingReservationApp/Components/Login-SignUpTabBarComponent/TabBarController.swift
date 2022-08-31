//
//  TabBarController.swift
//  NobingReservationApp
//
//  Created by Konstantinos Stergiannis on 30/8/22.
//

import Foundation
import UIKit
import MaterialComponents.MaterialAppBar
import MaterialComponents.MaterialTabs_TabBarView
import MaterialComponents.MaterialTabs_TabBarViewTheming

class TabBarController: UIViewController {
  
    var loginVC: LoginViewController = {
        let vc = LoginViewController()
        vc.view.translatesAutoresizingMaskIntoConstraints = false
        return vc
    }()
    
    var signUpVC: SignUpViewController = {
        let vc = SignUpViewController(nibName: nil, bundle: nil)
        vc.view.translatesAutoresizingMaskIntoConstraints = false
        return vc
    }()

    
    lazy var rootView: TabBarView = {
        let view = TabBarView(frame: .zero)
        view.tabBarView.items = [
            UITabBarItem(title: "Log In", image: nil, tag: 0),
            UITabBarItem(title: "Sign In", image: nil, tag: 1)
        ]
        view.tabBarView.selectedItem = view.tabBarView.items.first
        view.tabBarView.tabBarDelegate = self
        return view
    }()
    
    
    // MARK: - Overrides
    
    override func loadView() {
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()        
        add(child: loginVC)
    }
    
    // MARK: - Handlers
    
    func add(child: UIViewController) {
        addChild(child)
        rootView.addAndConstraintContainedSubview(child.view)
        child.didMove(toParent: self)
    }
    
    func remove(child: UIViewController) {
        child.willMove(toParent: nil)
        child.view.removeFromSuperview()
        child.removeFromParent()
    }
    
}

extension TabBarController: MDCTabBarViewDelegate {
    
    func tabBarView(_ tabBarView: MDCTabBarView, didSelect item: UITabBarItem) {
        if let last = children.last {
            remove(child: last)
        }
        
        let vc: UIViewController
        switch item.tag {
        case 0:
            vc = loginVC
        case 1:
            vc = signUpVC
        default:
            fatalError("Profile tab item not implemented.")
        }
        
        add(child: vc)
    }
    
    func tabBarView(_ tabBarView: MDCTabBarView, shouldSelect item: UITabBarItem) -> Bool {
        return tabBarView.selectedItem != item
    }
}

