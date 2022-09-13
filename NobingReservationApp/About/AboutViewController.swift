//
//  AboutViewController.swift
//  NobingReservationApp
//
//  Created by Konstantinos Stergiannis on 18/8/22.
//

import UIKit

class AboutViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor().hexStringToUIColor(hex: "#f5ebe0")
        //view.addSubview(topbar)
        
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
        let image = UIImageView(image: UIImage(named: "aboutPhoto"))
        image.layer.cornerRadius = 55
        image.clipsToBounds = true
        image.layer.borderColor = UIColor().hexStringToUIColor(hex: "#f5ebe0").cgColor
        image.layer.borderWidth = 2
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var aboutView: UIView = {
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
        view.backgroundColor = UIColor().hexStringToUIColor(hex: "#f5ebe0")
        view.layer.shadowOffset = CGSize(width: 10, height: 10)
        view.layer.shadowRadius = 10
        view.layer.shadowOpacity = 0.5
        view.layer.cornerRadius = 15
        //view.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        view.autoresizingMask = [.flexibleWidth, .flexibleBottomMargin]
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var bioText: UILabel = {
        var label = UILabel()
        label.backgroundColor = .clear
        label.sizeToFit()
        //label.contentMode = .scaleAspectFit
        label.text = "Hello,\n\n My name is Konstantinos Stergiannis.I am graduated student of informatics engineering at Hellenic Mediterranean University of Crete.\nI was born on July 29th 1998 in Ptolemaida,in a small town in western Macedonia.I took the panhellenics exams back in 2016 , where i passed the department of informatics engeering.After a course of thirty and a half year and six month of intership at Hellenic mediterranean University of Crete i received my Bachelor degree./n At my intership i sterted to study Angular,Typescript,NodeJS and Ionic framework and after that i created my thesis project named 'Create a reservation web app for North Greece'. I created my thesis project's frontend with Angular-Typescript-Ionic  and the backend with MySQL,NodeJS,NodeJS-Express(API). After these 5 years, at july of 2021 i started my military service at Alexandroupoli where i completed it at april of 2022.At May of 2022 since i am working as an iOS Developer at Express Publishing at the expressDigibooks team."
        label.textAlignment = .left
        label.numberOfLines = 0
        //label.lineBreakMode = .byWordWrapping
        label.font = UIFont(name: "HelveticaNeue-Thin", size: 17)
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
        aboutView.addSubview(textView)
        textView.addSubview(bioText)
        aboutView.addSubview(profilImage)
        scrollView.addSubview(aboutView)
        view.addSubview(scrollView)
        view.addSubview(topbar)
        //scrollView.addSubview(textView)
    }
    func removeSubviews() {
        print("remove")
        scrollView.removeFromSuperview()
        topbar.removeFromSuperview()
        aboutView.removeFromSuperview()
        textView.removeFromSuperview()
       // bioText.removeFromSuperview()
    }
  
    
    func constraint(with traitCollection: UITraitCollection){
    
        topbar.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        topbar.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        topbar.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        topbar.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        aboutView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor).isActive = true
        aboutView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor).isActive = true
        aboutView.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor).isActive = true
        aboutView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor).isActive = true
        aboutView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor).isActive = true
        aboutView.heightAnchor.constraint(equalTo:scrollView.contentLayoutGuide.heightAnchor).isActive = true
        
        profilImage.centerYAnchor.constraint(equalTo: textView.topAnchor).isActive = true
        profilImage.centerXAnchor.constraint(equalTo: textView.centerXAnchor).isActive = true
        profilImage.topAnchor.constraint(equalTo: aboutView.topAnchor).isActive = true
        profilImage.widthAnchor.constraint(equalToConstant: 110).isActive = true
        profilImage.heightAnchor.constraint(equalToConstant: 110).isActive = true
        
      
//      textView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor).isActive = true
//      textView.topAnchor.constraint(equalTo: aboutView.bottomAnchor).isActive = true
//      textView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor).isActive = true
//      textView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor).isActive = true
//      textView.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor).isActive = true
//      textView.heightAnchor.constraint(equalTo: scrollView.contentLayoutGuide.heightAnchor).isActive = true
        textView.leadingAnchor.constraint(equalTo: aboutView.leadingAnchor,constant: 15).isActive = true
        textView.topAnchor.constraint(equalTo: profilImage.centerYAnchor).isActive = true
        textView.trailingAnchor.constraint(equalTo: aboutView.trailingAnchor,constant: -15).isActive = true
       // textView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor).isActive = true
        
        bioText.topAnchor.constraint(equalTo: profilImage.bottomAnchor).isActive = true
        bioText.leadingAnchor.constraint(equalTo: textView.leadingAnchor,constant: 5).isActive = true
        bioText.bottomAnchor.constraint(equalTo: textView.bottomAnchor).isActive = true
        
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: topbar.bottomAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
           if traitCollection.horizontalSizeClass == .regular &&
               traitCollection.verticalSizeClass == .regular {
               aboutView.heightAnchor.constraint(equalToConstant: 700.0).isActive = true
               textView.heightAnchor.constraint(equalToConstant: 550.0).isActive = true
           } else if traitCollection.horizontalSizeClass == .regular && traitCollection.verticalSizeClass == .compact ||
                       (traitCollection.horizontalSizeClass == .compact && traitCollection.verticalSizeClass == .compact) {
               
               aboutView.heightAnchor.constraint(equalToConstant: 450.0).isActive = true
               textView.heightAnchor.constraint(equalToConstant: 350.0).isActive = true
               bioText.heightAnchor.constraint(equalToConstant: textView.frame.size.width).isActive = true
               bioText.trailingAnchor.constraint(equalTo: textView.safeAreaLayoutGuide.trailingAnchor,constant: -5).isActive = true
           }else {
               
               aboutView.heightAnchor.constraint(equalToConstant: 650.0).isActive = true
               textView.heightAnchor.constraint(equalToConstant: 580.0).isActive = true
               bioText.heightAnchor.constraint(equalToConstant: textView.frame.size.width).isActive = true
               bioText.trailingAnchor.constraint(equalTo: textView.trailingAnchor,constant: -5).isActive = true
           }
    }
}
