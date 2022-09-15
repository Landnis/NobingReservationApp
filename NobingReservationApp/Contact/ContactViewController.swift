//
//  ContactViewController.swift
//  NobingReservationApp
//
//  Created by Konstantinos Stergiannis on 4/8/22.
//

import UIKit
import MaterialComponents.MDCActionSheetController
import MaterialComponents.MDCActionSheetController_MaterialTheming
class ContactViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
        topbar.delegate = self
        addSubviews(with: traitCollection)
        constraint(with: traitCollection)
    }
    
    lazy var contactView: ContactUsView = {
        let view = ContactUsView(frame: .zero)
        view.backgroundColor = UIColor().hexStringToUIColor(hex: "#d6ccc2")
        view.layer.shadowOffset = CGSize(width: 10, height: 10)
        view.layer.shadowRadius = 10
        view.layer.shadowOpacity = 0.5
        view.layer.cornerRadius = 15
        //view.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        view.autoresizingMask = [.flexibleWidth, .flexibleBottomMargin]
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    
    lazy var topbar: TopBarView = {
         let topbar = TopBarView()
         topbar.translatesAutoresizingMaskIntoConstraints = false
         return topbar
     }()
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.contentInsetAdjustmentBehavior = .never
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.setContentHuggingPriority(.defaultLow, for: .horizontal)
        scrollView.setContentHuggingPriority(.defaultLow, for: .vertical)
        return scrollView
    }()
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        print("Changed")
        removeSubviews()
        addSubviews(with: traitCollection)
        constraint(with: traitCollection)
    }
    func addSubviews(with traitCollection: UITraitCollection){
        print("add")
        view.addSubview(topbar)
        scrollView.addSubview(contactView)
        view.addSubview(scrollView)
    }
    
    func constraint(with traitCollection: UITraitCollection){
        topbar.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        topbar.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        topbar.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        topbar.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: topbar.bottomAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
       contactView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor,constant: 20).isActive = true
       contactView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor,constant: 20).isActive = true
       contactView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor).isActive = true
       contactView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor).isActive = true
       contactView.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor,constant: -45).isActive = true
       contactView.heightAnchor.constraint(equalTo: scrollView.contentLayoutGuide.heightAnchor).isActive = true
        
        if traitCollection.horizontalSizeClass == .regular &&
            traitCollection.verticalSizeClass == .regular {
           contactView.heightAnchor.constraint(equalToConstant: 500).isActive = true
            print(contactView.frame.size.height)

        } else if traitCollection.horizontalSizeClass == .regular && traitCollection.verticalSizeClass == .compact ||
                    (traitCollection.horizontalSizeClass == .compact && traitCollection.verticalSizeClass == .compact) {
            
            self.contactView.heightAnchor.constraint(equalToConstant: 1000).isActive = true
            print(contactView.frame.size.height)
        }else {
            self.contactView.heightAnchor.constraint(equalToConstant: 600).isActive = true
            print(contactView.frame.size.height)
        }
    }
    
    func removeSubviews() {
        print("remove")
//        contactView.formStackView.removeFromSuperview()
//        contactView.buttonStackView.removeFromSuperview()
//        contactView.contactUsLabel.removeFromSuperview()
//        contactView.usernameTextField.removeFromSuperview()
//        contactView.emailTextField.removeFromSuperview()
//        contactView.textView.removeFromSuperview()
//        contactView.subjectTextField.removeFromSuperview()
//        contactView.contactButton.removeFromSuperview()
//        contactView.activityIndicator.removeFromSuperview()
        contactView.removeFromSuperview()
        scrollView.removeFromSuperview()
    }

}
extension ContactViewController :TopBarViewDelegate {
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
