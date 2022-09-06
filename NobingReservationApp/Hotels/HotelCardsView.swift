//
//  HotelsView.swift
//  NobingReservationApp
//
//  Created by Konstantinos Stergiannis on 25/8/22.
//

import Foundation
import MaterialComponents
import UIKit
protocol HotelCardsDelegate:AnyObject {
    func hotelCardTapped(title:String,image:UIImage,subTitle:String,phone:String,price:Float)
}

class HotelCardsView: MDCCardCollectionCell {
    weak var delegate: HotelCardsDelegate?
    var price: Float!
     lazy var imageCard: UIImageView = {
        var image = UIImageView()
        //image.image = UIImage(named: "hotelTerelidis")
        image.contentMode = .scaleAspectFill
       // image.backgroundColor = .yellow
        image.clipsToBounds = true
        image.layer.cornerRadius = 15
        image.setContentHuggingPriority(.defaultLow, for: .vertical)
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    let cardButton: MDCButton = {
        let button = MDCButton()
        button.backgroundColor = UIColor().hexStringToUIColor(hex:"#457b9d")
        button.layer.cornerRadius = 20
        button.layer.shadowRadius = 15
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(cardButtonTouchUpInsideHandler(_:)), for: .touchUpInside)
        button.setTitle("Book", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    @objc func cardButtonTouchUpInsideHandler(_ sender: MDCButton) {
        delegate?.hotelCardTapped(title: labelCard.text!,image: imageCard.image!,subTitle: subLabel.text!,phone: phone.text!,price:price)
        
    }
    
     let labelCard: UILabel = {
        var label = UILabel()
        label.backgroundColor = .clear
        label.sizeToFit()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont(name: "HelveticaNeue-Light", size: 24)
        label.setContentHuggingPriority(.defaultHigh, for: .vertical)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var verifiedIcon: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "verified_filled_x20").withTintColor(UIColor().hexStringToUIColor(hex: "#118ab2")))
        imageView.contentMode = .topLeft
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }()
    lazy var titleStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [labelCard,verifiedIcon])
            stackView.axis = .horizontal
            stackView.spacing = 5.0
            stackView.translatesAutoresizingMaskIntoConstraints = false
            return stackView
    }()
    
    let subLabel: UILabel = {
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
    
    let phone: UILabel = {
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
    //UIImageView(image: #imageLiteral(resourceName: "phone_x20"))
    lazy var phoneIcon: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "phone_x20"))
        imageView.tintColor = .black
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var phoneStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [phoneIcon,phone])
         stackView.axis = .horizontal
         stackView.spacing = 5.0
         stackView.translatesAutoresizingMaskIntoConstraints = false
         return stackView
     }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(contentView)
        contentView.addSubview(imageCard)
        contentView.addSubview(titleStackView)
        contentView.addSubview(cardButton)
        contentView.addSubview(addressIcon)
        contentView.addSubview(subLabel)
        contentView.addSubview(phoneStackView)
        contentView.clipsToBounds = true
        contentView.backgroundColor = UIColor().hexStringToUIColor(hex: "#a8dadc")
        contentView.sizeToFit()

        contentView.layer.cornerRadius = 15
        contentView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        contentView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        //contentView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        imageCard.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        imageCard.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        imageCard.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        imageCard.bottomAnchor.constraint(equalTo: contentView.centerYAnchor ).isActive = true
        //imageCard.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        titleStackView.topAnchor.constraint(equalTo: imageCard.bottomAnchor,constant: 20).isActive = true
        titleStackView.leadingAnchor.constraint(equalTo: imageCard.leadingAnchor,constant: contentView.frame.size.width/3-20).isActive = true
        titleStackView.trailingAnchor.constraint(equalTo: imageCard.trailingAnchor,constant: -20).isActive = true
        
        addressIcon.topAnchor.constraint(equalTo: titleStackView.bottomAnchor,constant: 15).isActive = true
        addressIcon.leadingAnchor.constraint(equalTo: imageCard.leadingAnchor).isActive = true
        
        subLabel.topAnchor.constraint(equalTo: addressIcon.topAnchor).isActive = true
        subLabel.leadingAnchor.constraint(equalTo: addressIcon.leadingAnchor,constant: 25).isActive = true
        subLabel.trailingAnchor.constraint(equalTo: imageCard.trailingAnchor).isActive = true
        
        phoneStackView.topAnchor.constraint(equalTo: addressIcon.bottomAnchor,constant: 30).isActive = true
        phoneStackView.leadingAnchor.constraint(equalTo: addressIcon.leadingAnchor).isActive = true
        
//        cardStackView.topAnchor.constraint(equalTo:  addressIcon.topAnchor).isActive = true
//        cardStackView.leadingAnchor.constraint(equalTo:  addressIcon.leadingAnchor).isActive = true
//        cardStackView.trailingAnchor.constraint(equalTo:  labelCard.trailingAnchor).isActive = true
        
        cardButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20).isActive = true
        cardButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30).isActive = true
        cardButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -30).isActive = true
        cardButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
           let targetSize = CGSize(width: layoutAttributes.frame.width, height: 0)
           layoutAttributes.frame.size = contentView.systemLayoutSizeFitting(targetSize, withHorizontalFittingPriority: .required, verticalFittingPriority: .fittingSizeLevel)
           return layoutAttributes
       }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(label: String){
        labelCard.text = label
    }
    public func configure(priceL: Float){
        price = priceL
    }
    public func configure(labelSub: String){
        subLabel.text = labelSub
    }
    
    public func configure(phoneLabel: String){
        phone.text = phoneLabel
    }
    
    public func configure(with image: UIImage){
        imageCard.image = image
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        labelCard.text = nil
    }

    
}
