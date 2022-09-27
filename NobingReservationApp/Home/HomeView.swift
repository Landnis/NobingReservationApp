//
//  HomeView.swift
//  NobingReservationApp
//
//  Created by Konstantinos Stergiannis on 22/9/22.
//

import UIKit
import MaterialComponents.MDCActionSheetController
import MaterialComponents.MDCActionSheetController_MaterialTheming
import MaterialComponents
class HomeView: MDCCardCollectionCell {
    
    lazy var locationView: UIView = {
        let view = UIView(frame: frame)
        view.backgroundColor = UIColor().hexStringToUIColor(hex:"#f2e9e4").withAlphaComponent(0.75)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var cityLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.sizeToFit()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont(name: "HelveticaNeue-Light", size: 25)
        label.setContentHuggingPriority(.defaultHigh, for: .vertical)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var imageCard: UIImageView = {
       var image = UIImageView()
       image.contentMode = .scaleToFill
      // image.clipsToBounds = false
      // image.setContentHuggingPriority(.defaultLow, for: .vertical)
       image.translatesAutoresizingMaskIntoConstraints = false
       return image
   }()
    
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.backgroundColor = UIColor().hexStringToUIColor(hex: "#2a9d8f")
        layer.shadowOffset = CGSize(width: 5, height: 5)
        layer.shadowRadius = 10
        layer.shadowOpacity = 0.5
        layer.cornerRadius = 15
        self.addSubview(imageCard)
        imageCard.addSubview(locationView)
        locationView.addSubview(cityLabel)
        homeViewconstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func homeViewconstraint() {
        contentView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        contentView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        locationView.topAnchor.constraint(equalTo: imageCard.centerYAnchor).isActive = true
        locationView.bottomAnchor.constraint(equalTo: imageCard.bottomAnchor).isActive = true
        locationView.leadingAnchor.constraint(equalTo: imageCard.leadingAnchor).isActive = true
        locationView.trailingAnchor.constraint(equalTo: imageCard.trailingAnchor).isActive = true
        
        cityLabel.topAnchor.constraint(equalTo: locationView.centerYAnchor).isActive = true
        cityLabel.leadingAnchor.constraint(equalTo: locationView.leadingAnchor).isActive = true
        cityLabel.trailingAnchor.constraint(equalTo: locationView.trailingAnchor).isActive = true

    }
    
//    public func configure(label: String){
//        cityLabel.text = label
//    }
//    public func configure(labelSub: String){
//        cityDescription.text = labelSub
//    }
//    public func configure(area: String){
//        cityArea.text = area
//    }
//    public func configure(with image: UIImage){
//        imageCard.image = image
//    }
    
    
}

