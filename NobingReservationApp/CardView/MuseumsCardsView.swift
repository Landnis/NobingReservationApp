//
//  MuseumsCardsView.swift
//  NobingReservationApp
//
//  Created by Konstantinos Stergiannis on 2/8/22.
//

import Foundation
import MaterialComponents
import UIKit

class MuseumsCardView: MDCCardCollectionCell {
    
     let imageCard: UIImageView = {
        var image = UIImageView()
        //image.image = UIImage(named: "hotelTerelidis")
        image.contentMode = .scaleAspectFill
       // image.backgroundColor = .yellow
        image.clipsToBounds = true
        image.setContentHuggingPriority(.defaultLow, for: .vertical)
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    let cardButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor().hexStringToUIColor(hex:"#457b9d")
        button.layer.cornerRadius = 18
        button.setTitle("Visit", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
     let labelCard: UILabel = {
        var label = UILabel()
        label.backgroundColor = .green
       // label.text = "Customsfdsfsdsfddfddfdfsfsdfdsffsdfdsfsfdfsdfsdfdsfdsfdfsfsdfsdfsdfsfdsfdssfdssdfsdf"
        label.textAlignment = .center
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont(name: "Helvetica", size: 16)
        label.setContentHuggingPriority(.defaultHigh, for: .vertical)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.shadowOpacity = 0.8
        self.addSubview(contentView)
        contentView.addSubview(imageCard)
        contentView.addSubview(labelCard)
        contentView.addSubview(cardButton)
        contentView.addSubview(subLabel)
        contentView.clipsToBounds = true
        contentView.backgroundColor = UIColor().hexStringToUIColor(hex: "#a8dadc")
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
        imageCard.widthAnchor.constraint(equalTo: contentView.widthAnchor ).isActive = true
        //imageCard.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        labelCard.topAnchor.constraint(equalTo: imageCard.bottomAnchor,constant: 20).isActive = true
        labelCard.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 30).isActive = true
        labelCard.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -30).isActive = true
        
        subLabel.topAnchor.constraint(equalTo: labelCard.bottomAnchor, constant: 20).isActive = true
        subLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 30).isActive = true
        subLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -30).isActive = true
        
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
    public func configure(labelSub: String){
        subLabel.text = labelSub
    }
    
    public func configure(with image: UIImage){
        imageCard.image = image
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        labelCard.text = nil
    }

    
}

