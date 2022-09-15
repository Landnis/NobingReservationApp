//
//  InfoViewController.swift
//  NobingReservationApp
//
//  Created by Konstantinos Stergiannis on 3/8/22.
//

import UIKit
import MaterialComponents.MDCActionSheetController
import MaterialComponents.MDCActionSheetController_MaterialTheming
class InfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor().hexStringToUIColor(hex: "#d6ccc2")
        addSubviews(with: traitCollection)
        constraint(with: traitCollection)
    }
    
    lazy var scrollView: UIScrollView = {
        var view = UIScrollView(frame: .zero)
        view.backgroundColor = .clear
        view.frame = self.view.bounds
        view.autoresizingMask = .flexibleHeight
        view.bounces = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
   
    lazy var profilImage : UIImageView = {
        let image = UIImageView(image: UIImage(named: "LaunchLogo"))
        image.layer.cornerRadius = 55
        image.clipsToBounds = true
        image.backgroundColor = .white
        image.layer.borderColor = UIColor().hexStringToUIColor(hex: "#f5ebe0").cgColor
        image.layer.borderWidth = 2
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var infoView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = UIColor().hexStringToUIColor(hex: "#BED3F3")
        view.layer.shadowOffset = CGSize(width: 10, height: 10)
        view.layer.shadowRadius = 10
        view.layer.shadowOpacity = 0.5
        view.layer.cornerRadius = 15
        view.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        view.autoresizingMask = [.flexibleWidth, .flexibleBottomMargin]
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var textView: UIView = {
        let view = UIView(frame: .zero)
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
    var titleText: UILabel = {
        var label = UILabel()
        label.backgroundColor = .clear
        label.sizeToFit()
        label.text = "Informations"
        label.textAlignment = .center
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont(name: "HelveticaNeue-ThinItalic", size: 25)
        label.setContentHuggingPriority(.defaultHigh, for: .vertical)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var infoText: UILabel = {
        var label = UILabel()
        label.backgroundColor = .clear
        label.sizeToFit()
        label.text = "NoBinG application is a booking app in which you can make a reservation for any hotel in the app.\nAlso, anyone can book a ticket for museums in the application as well as book a table in any restaurant of their choice.Finally, there is also the possibility of car rentals with various categories of cars.\n Everything mentioned above is certified by the application."
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = UIFont(name: "HelveticaNeue-Thin", size: 20)
        label.isUserInteractionEnabled = false
        label.setContentHuggingPriority(.defaultHigh, for: .vertical)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
   lazy var topbar: TopBarView = {
        var topBar = TopBarView()
        topBar.translatesAutoresizingMaskIntoConstraints = false
        return topBar
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
        infoView.addSubview(textView)
        infoView.addSubview(titleText)
        textView.addSubview(infoText)
        infoView.addSubview(profilImage)
        scrollView.addSubview(infoView)
        view.addSubview(scrollView)
        view.addSubview(topbar)
        topbar.delegate = self
    }
    func removeSubviews() {
        print("remove")
        scrollView.removeFromSuperview()
        topbar.removeFromSuperview()
        infoView.removeFromSuperview()
        textView.removeFromSuperview()
        infoText.removeFromSuperview()
        titleText.removeFromSuperview()
    }
  
    
    func constraint(with traitCollection: UITraitCollection){
    
        topbar.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        topbar.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        topbar.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        topbar.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        infoView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor).isActive = true
        infoView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor).isActive = true
        infoView.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor).isActive = true
        infoView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor).isActive = true
        infoView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor).isActive = true
        infoView.heightAnchor.constraint(equalTo:scrollView.contentLayoutGuide.heightAnchor).isActive = true
        
        profilImage.centerYAnchor.constraint(equalTo: textView.topAnchor).isActive = true
        profilImage.centerXAnchor.constraint(equalTo: textView.centerXAnchor).isActive = true
        profilImage.topAnchor.constraint(equalTo: infoView.topAnchor).isActive = true
        profilImage.widthAnchor.constraint(equalToConstant: 110).isActive = true
        profilImage.heightAnchor.constraint(equalToConstant: 110).isActive = true
        
        textView.leadingAnchor.constraint(equalTo: infoView.leadingAnchor,constant: 15).isActive = true
        textView.topAnchor.constraint(equalTo: profilImage.centerYAnchor).isActive = true
        textView.trailingAnchor.constraint(equalTo: infoView.trailingAnchor,constant: -15).isActive = true
        
        titleText.topAnchor.constraint(equalTo: profilImage.bottomAnchor).isActive = true
        titleText.heightAnchor.constraint(equalToConstant: 25).isActive = true
        titleText.widthAnchor.constraint(equalTo: textView.widthAnchor).isActive = true
        titleText.leadingAnchor.constraint(equalTo: textView.leadingAnchor).isActive = true
        titleText.trailingAnchor.constraint(equalTo: textView.trailingAnchor).isActive = true
        
       infoText.topAnchor.constraint(equalTo: titleText.bottomAnchor).isActive = true
       infoText.leadingAnchor.constraint(equalTo: textView.leadingAnchor,constant: 5).isActive = true
       infoText.bottomAnchor.constraint(equalTo: textView.bottomAnchor).isActive = true
        
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: topbar.bottomAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
           if traitCollection.horizontalSizeClass == .regular &&
               traitCollection.verticalSizeClass == .regular {
               infoView.heightAnchor.constraint(equalToConstant: 700.0).isActive = true
               textView.heightAnchor.constraint(equalToConstant: 550.0).isActive = true
           } else if traitCollection.horizontalSizeClass == .regular && traitCollection.verticalSizeClass == .compact ||
                       (traitCollection.horizontalSizeClass == .compact && traitCollection.verticalSizeClass == .compact) {
               
               infoView.heightAnchor.constraint(equalToConstant: 350.0).isActive = true
               textView.heightAnchor.constraint(equalToConstant: 200.0).isActive = true
               infoText.heightAnchor.constraint(equalToConstant: textView.frame.size.width).isActive = true
               infoText.trailingAnchor.constraint(equalTo: textView.safeAreaLayoutGuide.trailingAnchor,constant: -5).isActive = true
           }else {
               
               infoView.heightAnchor.constraint(equalToConstant: 450.0).isActive = true
               textView.heightAnchor.constraint(equalToConstant: 350.0).isActive = true
               infoText.heightAnchor.constraint(equalToConstant: textView.frame.size.width).isActive = true
               infoText.trailingAnchor.constraint(equalTo: textView.trailingAnchor,constant: -5).isActive = true
           }
    }
}
extension InfoViewController :TopBarViewDelegate {
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
