//
//  RestaurantsViewController.swift
//  NobingReservationApp
//
//  Created by Konstantinos Stergiannis on 3/8/22.
//

import UIKit
import MaterialComponents
import MaterialComponents.MDCActionSheetController
import MaterialComponents.MDCActionSheetController_MaterialTheming
class RestaurantsViewController: UIViewController {

    var selectedCard: UIView = {
        let card = UIView()
       card.backgroundColor = UIColor().hexStringToUIColor(hex: "#BED3F3")
       card.layer.shadowOffset = CGSize(width: 10, height: 10)
       card.layer.shadowRadius = 10
       card.layer.shadowOpacity = 0.5
       card.layer.cornerRadius = 15
       card.autoresizingMask = [.flexibleWidth, .flexibleBottomMargin]
       card.translatesAutoresizingMaskIntoConstraints = false
        return card
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        view.addSubview(topbar)
        view.addSubview(selectedCard)
        constraint()
    }
    lazy var topbar: TopBarView = {
         let topbar = TopBarView()
         topbar.translatesAutoresizingMaskIntoConstraints = false
         return topbar
     }()
    func constraint(){
      topbar.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
      topbar.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
      topbar.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
      topbar.heightAnchor.constraint(equalToConstant: 100).isActive = true
      
      selectedCard.topAnchor.constraint(equalTo: topbar.bottomAnchor,constant: 30).isActive = true
      selectedCard.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20).isActive = true
      selectedCard.widthAnchor.constraint(equalToConstant: 200).isActive = true
      selectedCard.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }

}

extension RestaurantsViewController: TopBarViewDelegate {
    func tappedMenu() {
        print("Hello")
    }
    
    func logoutAlert() {
        let viewController = LoginViewController()
        viewController.modalTransitionStyle = .crossDissolve
        viewController.modalPresentationStyle = .fullScreen

        let actionSheet = MDCActionSheetController(title: "Logout",
                                                   message: "Press Here if you want to logout!")
        let actionOne = MDCActionSheetAction(title: "Logout",
                                             image: UIImage(named: "logout_x20"),
                                             handler: { _ in self.present(viewController, animated: true)})
        actionSheet.addAction(actionOne)
        present(actionSheet, animated: true, completion: nil)
///UIAlert with actionSheet example
//        let optionMenu = UIAlertController(title: nil, message: "Choose Option", preferredStyle: .actionSheet)
//        let logoutAction = UIAlertAction(title: "Logout", style: .default,handler: {(action) in self.present(viewController,animated: true)})
//        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
//        optionMenu.addAction(logoutAction)
//        optionMenu.addAction(cancelAction)
//        self.present(optionMenu, animated: true, completion: nil)
    }
    
}
