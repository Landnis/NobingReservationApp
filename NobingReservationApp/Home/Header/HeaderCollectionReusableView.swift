//
//  HeaderCollectionReusableView.swift
//  NobingReservationApp
//
//  Created by Konstantinos Stergiannis on 26/9/22.
//

import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {
        static let identifier = "HeaderCollectionReusableView"
    var collectionView: UICollectionView?
  
    override init(frame: CGRect){
        super.init(frame: .zero)
        addSubview(topbar)
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collectionView = UICollectionView(frame: .zero,collectionViewLayout: layout)
        guard let collectionView = collectionView else {
            return
        }
        collectionView.register(HeaderView.self, forCellWithReuseIdentifier: "HeaderCell")
        layout.minimumInteritemSpacing = 5.0
        layout.minimumLineSpacing = 5.0
        collectionView.delegate = self
        collectionView.dataSource = self
        addSubview(collectionView)
        //collectionView.layer.cornerRadius = 15
        collectionView.backgroundColor = .clear
        //collectionView.frame = self.bounds
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        headerConstraints()
    }
    lazy var topbar: TopBarView = {
         let topbar = TopBarView()
         topbar.translatesAutoresizingMaskIntoConstraints = false
         return topbar
     }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configure(with showColor: Bool){
        if showColor {
            topbar.isHidden = true
            backgroundColor = UIColor().hexStringToUIColor(hex: "#f5ebe0")
        }
    }
    
    func headerConstraints() {
        topbar.topAnchor.constraint(equalTo: topAnchor).isActive = true
        topbar.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        topbar.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        topbar.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        collectionView?.topAnchor.constraint(equalTo: topAnchor).isActive = true
        collectionView?.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        collectionView?.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        collectionView?.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true

               
    }
    
}

extension HeaderCollectionReusableView: UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return cityModelData.count
}

func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HeaderCell", for: indexPath) as! HeaderView
    let cityImages = cityModelData
    cell.imageCard.image = cityImages[indexPath.row].image!
    cell.cityLabel.text = cityImages[indexPath.row].location!
    cell.cityDescription.text = cityImages[indexPath.row].description!
    return cell
}

func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    print("Select section \(indexPath.section) and row \(indexPath.row)")

}
func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: self.frame.size.width, height: self.frame.size.width+100)
}
    
}
