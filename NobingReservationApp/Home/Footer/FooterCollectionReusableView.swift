//
//  FooterCollectionReusableView.swift
//  NobingReservationApp
//
//  Created by Konstantinos Stergiannis on 26/9/22.
//

import UIKit

class FooterCollectionReusableView: UICollectionReusableView {
    static let identifier = "FooterCollectionReusableView"
    let dateFormatter = DateFormatter()
    let date = Date()
    lazy var NoBinGLabel:UILabel = {
        let label = UILabel()
        label.text = "NoBinG App"
        label.font = UIFont(name: "HelveticaNeue-Light", size: 19)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var copyRightIcon: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "copyRight_x18"))
        imageView.contentMode = .topLeft
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    lazy var dateLabel:UILabel = {
        let label = UILabel()
        dateFormatter.dateFormat = "yyyy"
        label.text = "\(dateFormatter.string(from: date))"
        label.font = UIFont(name: "HelveticaNeue-Light", size: 19)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var footerStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [NoBinGLabel,copyRightIcon,dateLabel])
         stackView.axis = .horizontal
         stackView.spacing = 5.0
         stackView.translatesAutoresizingMaskIntoConstraints = false
         return stackView
     }()
    
    
    override init(frame: CGRect){
        super.init(frame: .zero)
        backgroundColor = UIColor().hexStringToUIColor(hex: "#f5ebe0")
        addSubview(footerStackView)
        addFooterConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addFooterConstraints(){
        footerStackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        footerStackView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
    
}
