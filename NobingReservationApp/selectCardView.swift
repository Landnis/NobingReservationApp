//
//  selectCardView.swift
//  NobingReservationApp
//
//  Created by Konstantinos Stergiannis on 17/8/22.
//

import Foundation
import UIKit
import MaterialComponents

class selectCardView: UIViewController {
   
    var img = UIImageView()
    var hotel_title:String = ""
    var address_title:String = ""
    var phone_label:String = ""
    var price_label:String = ""
    
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
    
    lazy var Image: UIImageView = {
        var image = UIImageView()
        image.contentMode = .scaleToFill
       image.layer.cornerRadius = 10
       image.clipsToBounds = true
       image.setContentHuggingPriority(.defaultLow, for: .vertical)
       image.translatesAutoresizingMaskIntoConstraints = false
       return image
   }()
    
    lazy var titleLabel: UILabel = {
       let label = UILabel()
        //label.text =
       label.backgroundColor = .clear
       label.textAlignment = .center
       label.numberOfLines = 0
       label.lineBreakMode = .byWordWrapping
       label.font = UIFont(name: "HelveticaNeue-Light", size: 24)
       label.setContentHuggingPriority(.defaultHigh, for: .vertical)
       label.translatesAutoresizingMaskIntoConstraints = false
       return label
   }()
    
    lazy var addressLabel: UILabel = {
       var label = UILabel()
       label.backgroundColor = .clear
       label.textAlignment = .left
       label.numberOfLines = 0
       label.lineBreakMode = .byWordWrapping
       label.font = UIFont(name: "Helvetica", size: 16)
       label.setContentHuggingPriority(.defaultHigh, for: .vertical)
       label.translatesAutoresizingMaskIntoConstraints = false
       return label
   }()
  
    lazy var addressIcon: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "location_x20"))
        imageView.tintColor = .black
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var phoneLabel: UILabel = {
       var label = UILabel()
       label.backgroundColor = .clear
       label.textAlignment = .left
       label.numberOfLines = 0
       label.lineBreakMode = .byWordWrapping
       label.font = UIFont(name: "Helvetica", size: 16)
       label.setContentHuggingPriority(.defaultHigh, for: .vertical)
       label.translatesAutoresizingMaskIntoConstraints = false
       return label
   }()
    lazy var phoneIcon: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "phone_x20"))
        imageView.tintColor = .black
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var priceLabel: UILabel = {
       var label = UILabel()
       label.backgroundColor = .clear
       label.textAlignment = .left
       label.numberOfLines = 0
       label.lineBreakMode = .byWordWrapping
       label.font = UIFont(name: "Helvetica", size: 16)
       label.setContentHuggingPriority(.defaultHigh, for: .vertical)
       label.translatesAutoresizingMaskIntoConstraints = false
       return label
   }()
    
    lazy var priceIcon: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "price_x18"))
        imageView.tintColor = .black
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var priceStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [priceIcon,priceLabel])
         stackView.axis = .horizontal
         stackView.spacing = 5.0
         stackView.translatesAutoresizingMaskIntoConstraints = false
         return stackView
     }()
    lazy var phoneStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [phoneIcon,phoneLabel])
         stackView.axis = .horizontal
         stackView.spacing = 5.0
         stackView.translatesAutoresizingMaskIntoConstraints = false
         return stackView
     }()
    
    lazy var cardStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [phoneStackView,priceStackView])
         stackView.axis = .vertical
         stackView.spacing = 10.0
         stackView.translatesAutoresizingMaskIntoConstraints = false
         return stackView
     }()
    
    var closeButton: MDCButton = {
        let button = MDCButton()
        button.setImage(#imageLiteral(resourceName: "close_x20").withRenderingMode(.alwaysTemplate), for: .normal)
        button.backgroundColor = UIColor().hexStringToUIColor(hex: "#457b9d")
        button.tintColor = .black
        button.addTarget(self, action: #selector(closeButtonTouchUpInsideHandler(_:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc func closeButtonTouchUpInsideHandler(_ sender: MDCButton) {
        dismiss(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor().hexStringToUIColor(hex: "#457b9d")
        view.addSubview(selectedCard)
        view.addSubview(closeButton)
        selectedCard.addSubview(Image)
        selectedCard.addSubview(titleLabel)
        selectedCard.addSubview(addressIcon)
        selectedCard.addSubview(addressLabel)
        selectedCard.addSubview(cardStackView)
        constraintLayout()
        titleLabel.text = hotel_title
        Image.image = img.image
        addressLabel.text = address_title
        phoneLabel.text = phone_label
        priceLabel.text = price_label
       
    }
    func constraintLayout() {
        selectedCard.topAnchor.constraint(equalTo: view.topAnchor,constant: 100).isActive = true
        selectedCard.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20).isActive = true
        selectedCard.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20).isActive = true

        closeButton.topAnchor.constraint(equalTo: view.topAnchor,constant: 20).isActive = true
        closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -15).isActive = true
        
        Image.topAnchor.constraint(equalTo: selectedCard.topAnchor).isActive = true
        Image.leadingAnchor.constraint(equalTo: selectedCard.leadingAnchor).isActive = true
        Image.trailingAnchor.constraint(equalTo: selectedCard.trailingAnchor).isActive = true
        Image.bottomAnchor.constraint(equalTo: selectedCard.centerYAnchor).isActive = true

        
        titleLabel.topAnchor.constraint(equalTo: Image.bottomAnchor,constant: 20).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: Image.leadingAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: Image.trailingAnchor, constant: -30).isActive = true
        
        addressIcon.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: 20).isActive = true
        addressIcon.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor).isActive = true
        
        addressLabel.topAnchor.constraint(equalTo: addressIcon.topAnchor).isActive = true
        addressLabel.leadingAnchor.constraint(equalTo: addressIcon.leadingAnchor,constant: 25).isActive = true
        addressLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor).isActive = true
        
       cardStackView.topAnchor.constraint(equalTo: addressLabel.bottomAnchor,constant: 15).isActive = true
       cardStackView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor).isActive = true
       cardStackView.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor).isActive = true

    }
    
}
