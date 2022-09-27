//
//  Headerview.swift
//  NobingReservationApp
//
//  Created by Konstantinos Stergiannis on 26/9/22.
//

import UIKit
import MaterialComponents
class HeaderView: MDCCardCollectionCell {
    var identifier = "HeaderView"
    
    lazy var imageCard: UIImageView = {
       var image = UIImageView()
        image.contentMode = .scaleToFill
       //image.clipsToBounds = false
      // image.setContentHuggingPriority(.defaultLow, for: .vertical)
       image.translatesAutoresizingMaskIntoConstraints = false
       return image
   }()
    
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
    lazy var cityDescription: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.sizeToFit()
        label.textAlignment = .left
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont(name: "HelveticaNeue-Light", size: 16)
        label.setContentHuggingPriority(.defaultHigh, for: .vertical)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    override init(frame: CGRect){
        super.init(frame: frame)
        self.addSubview(imageCard)
        imageCard.addSubview(locationView)
        locationView.addSubview(cityLabel)
        locationView.addSubview(cityDescription)
        headerViewConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func headerViewConstraints(){
        
        imageCard.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        imageCard.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        imageCard.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        imageCard.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        locationView.topAnchor.constraint(equalTo: imageCard.centerYAnchor,constant: 50).isActive = true
        locationView.bottomAnchor.constraint(equalTo: imageCard.bottomAnchor).isActive = true
        locationView.leadingAnchor.constraint(equalTo: imageCard.leadingAnchor).isActive = true
        locationView.trailingAnchor.constraint(equalTo: imageCard.trailingAnchor).isActive = true
        
        cityLabel.topAnchor.constraint(equalTo: locationView.topAnchor).isActive = true
        cityLabel.leadingAnchor.constraint(equalTo: locationView.leadingAnchor).isActive = true
        cityLabel.trailingAnchor.constraint(equalTo: locationView.trailingAnchor).isActive = true
            
        cityDescription.topAnchor.constraint(equalTo: cityLabel.bottomAnchor).isActive = true
        cityDescription.leadingAnchor.constraint(equalTo: locationView.leadingAnchor).isActive = true
        cityDescription.trailingAnchor.constraint(equalTo: locationView.trailingAnchor).isActive = true
        cityDescription.bottomAnchor.constraint(equalTo: locationView.bottomAnchor).isActive = true
        
    }

}
