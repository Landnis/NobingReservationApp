//
//  TopBarView.swift
//  NobingReservationApp
//
//  Created by Konstantinos Stergiannis on 1/8/22.
//

import UIKit
import MaterialComponents
import SideMenu
protocol TopBarViewDelegate:AnyObject {
    func logoutAlert()
    func tappedMenu()
}

class TopBarView: UIView{
   weak var delegate: TopBarViewDelegate?
    private var sideMenu : SideMenuNavigationController?
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor().hexStringToUIColor(hex: "#f5ebe0")
        self.layer.shadowRadius = 10
        self.layer.shadowOpacity = 0.8
     
        addSubview(logoutButton)
        addSubview(menuButton)
        addSubview(imageView)
        constraints()
       // self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "tapBarLogo")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
   
    let logoutButton: MDCButton = {
        let button = MDCButton()
        button.setImage(#imageLiteral(resourceName: "logout_x20").withRenderingMode(.alwaysTemplate), for: .normal)
        button.backgroundColor = UIColor().hexStringToUIColor(hex: "#f5ebe0")
        button.tintColor = .black
        button.addTarget(self, action: #selector(logoutButtonTouchUpInsideHandler(_:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let menuButton: MDCButton = {
        let button = MDCButton()
        button.setImage(#imageLiteral(resourceName: "menu_x20").withRenderingMode(.alwaysTemplate), for: .normal)
        button.backgroundColor = UIColor().hexStringToUIColor(hex: "#f5ebe0")
        button.tintColor = .black
        button.addTarget(self, action: #selector(menuButtonTouchUpInsideHandler(_:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    func constraints(){
        logoutButton.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        logoutButton.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        menuButton.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        menuButton.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true

    }
    
    @objc func logoutButtonTouchUpInsideHandler(_ sender: UIButton) {
        delegate?.logoutAlert()
    }
    @objc func menuButtonTouchUpInsideHandler(_ sender: UIButton) {
        delegate?.tappedMenu()
    }

}

