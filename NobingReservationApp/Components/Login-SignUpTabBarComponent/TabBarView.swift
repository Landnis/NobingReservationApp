//
//  TapBarview.swift
//  NobingReservationApp
//
//  Created by Konstantinos Stergiannis on 31/8/22.
//

import Foundation
import UIKit
import MaterialComponents.MaterialTabs_TabBarView
import MaterialComponents.MaterialTabs_TabBarViewTheming

class TabBarView: UIView {
    
    lazy var tabBarView: MDCTabBarView = {
        let tabBarView = MDCTabBarView(frame: .zero)
        let containerScheme = MDCContainerScheme()
        tabBarView.applySurfaceTheme(withScheme: containerScheme)
        tabBarView.selectionIndicatorStrokeColor = UIColor().hexStringToUIColor(hex: "#463f3a")

        tabBarView.setTitleFont(UIFont(name: "HelveticaNeue", size: 18), for: .normal)
        tabBarView.setTitleFont(UIFont(name: "HelveticaNeue", size: 20), for: .selected)
        tabBarView.rippleColor = .lightGray
        tabBarView.setTitleColor(UIColor().hexStringToUIColor(hex: "#463f3a"), for: .selected)
        tabBarView.setTitleColor(UIColor().hexStringToUIColor(hex: "#7f7f7f"), for: .normal)
        //tabBarView.preferredLayoutStyle = .nonFixedClusteredCentered
        tabBarView.backgroundColor = UIColor().hexStringToUIColor(hex: "#f9dcc4")
        tabBarView.translatesAutoresizingMaskIntoConstraints = false
        tabBarView.setContentHuggingPriority(.defaultHigh, for: .vertical)
        tabBarView.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
        return tabBarView
    }()
    
    let containerView: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setContentHuggingPriority(.defaultLow, for: .vertical)
        view.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
        return view
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(tabBarView)
        self.addSubview(containerView)
        addSubviewsConstraints()
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Overrides

    
    // MARK: - Layout

    
    func addSubviewsConstraints() {
        tabBarView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        tabBarView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        tabBarView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        //tabBarView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        //tabBarView.heightAnchor.constraint(equalToConstant: 0).isActive = true
        
        containerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        containerView.topAnchor.constraint(equalTo: tabBarView.bottomAnchor).isActive = true
        containerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
    
    }
    
    func addAndConstraintContainedSubview(_ subview: UIView) {
        containerView.addSubview(subview)
        subview.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        subview.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        subview.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
        subview.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
    }
    
    func removeSubviews() {
        tabBarView.removeFromSuperview()
        containerView.removeFromSuperview()
    }
    func setup() {
        backgroundColor = UIColor().hexStringToUIColor(hex: "#f9dcc4")
    }
    
}
