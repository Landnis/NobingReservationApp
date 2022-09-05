//
//  BottomBarView.swift
//  NobingReservationApp
//
//  Created by Konstantinos Stergiannis on 5/9/22.
//

import UIKit
import MaterialComponents.MaterialBottomNavigation
import MaterialComponents.MaterialBottomNavigation_Theming
class BottomBarView: UIView {

    lazy var bottomNavigationBar: MDCBottomNavigationBar = {
        let bottomNavigationBar = MDCBottomNavigationBar()
        let containerScheme = MDCContainerScheme()
        bottomNavigationBar.applySurfaceTheme(withScheme:containerScheme)
        bottomNavigationBar.selectedItemTintColor = .systemGray
        bottomNavigationBar.selectedItemTitleColor = .systemGray
        //bottomNavigationBar.alignment = .justifiedAdjacentTitles
        bottomNavigationBar.translatesAutoresizingMaskIntoConstraints = false
        return bottomNavigationBar
    }()
    let containerView: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setContentHuggingPriority(.defaultLow, for: .vertical)
        view.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.bottomNavigationBar.backgroundColor = UIColor().hexStringToUIColor(hex: "#f5ebe0")
        self.bottomNavigationBar.layer.shadowRadius = 10
        self.bottomNavigationBar.layer.shadowOpacity = 0.5
        self.bottomNavigationBar.layer.cornerRadius = 15
        addSubviews(with: traitCollection)
        addSubviewsConstraints(with: traitCollection)
   
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func addSubviews(with traitCollection: UITraitCollection){
        addSubview(containerView)
        addSubview(bottomNavigationBar)
    }
    func addSubviewsConstraints(with traitCollection: UITraitCollection){
        bottomNavigationBar.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        bottomNavigationBar.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        bottomNavigationBar.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        // to extend the bottom nav bar behind the home bar
        // https://github.com/material-components/material-components-ios/pull/6612
        bottomNavigationBar.barItemsBottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        containerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        containerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        containerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: bottomNavigationBar.topAnchor).isActive = true
    }
    func removeSubviews() {
        containerView.removeFromSuperview()
        bottomNavigationBar.removeFromSuperview()
    }
    
    func addAndConstraintContainedSubview(_ subview: UIView){
        containerView.addSubview(subview)
        subview.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        subview.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        subview.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
        subview.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
    }
   
}
