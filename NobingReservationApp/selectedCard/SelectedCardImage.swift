//
//  SelectedCardTableViewController.swift
//  NobingReservationApp
//
//  Created by Konstantinos Stergiannis on 22/8/22.
//

import UIKit
import MaterialComponents
class SelectedCardImage: MDCCardCollectionCell  {

    lazy var Image: UIImageView = {
       var image = UIImageView()
       image.contentMode = .scaleAspectFill
       image.layer.cornerRadius = 15
       image.backgroundColor = UIColor().hexStringToUIColor(hex: "#BED3F3")
       image.clipsToBounds = true
       image.setContentHuggingPriority(.defaultHigh, for: .horizontal)
       image.translatesAutoresizingMaskIntoConstraints = false
       return image
   }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.frame.size.width = 400
        self.addSubview(contentView)
        contentView.addSubview(Image)
        contentView.clipsToBounds = true
        contentView.backgroundColor = .red
        contentView.contentMode = .scaleAspectFill
        contentView.layer.cornerRadius = 15
        contentView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews(){
        contentView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        contentView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        Image.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        Image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        Image.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        Image.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
    }

}
