//
//  MuseumViewController.swift
//  NobingReservationApp
//
//  Created by Konstantinos Stergiannis on 2/8/22.
//

import UIKit
import MaterialComponents
import MaterialComponents.MDCActionSheetController
import MaterialComponents.MDCActionSheetController_MaterialTheming

class MuseumViewController: UIViewController,AlertController{

    private var collectionView: UICollectionView?
 
    var topbar: TopBarView = {
        let topbar = TopBarView()
        topbar.translatesAutoresizingMaskIntoConstraints = false
        return topbar
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        topbar.delegate = self
        view.backgroundColor = UIColor().hexStringToUIColor(hex: "#f5ebe0")
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        collectionView = UICollectionView(frame: .zero,collectionViewLayout: layout)
        guard let collectionView = collectionView else {
            return
        }
        collectionView.register(MuseumsCardView.self, forCellWithReuseIdentifier: "cell")
        layout.itemSize = CGSize(width: view.frame.size.width, height: 500)
        layout.minimumInteritemSpacing = 60
        layout.minimumLineSpacing = 60
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor().hexStringToUIColor(hex: "#f5ebe0")
        collectionView.frame = view.bounds
        self.view.addSubview(collectionView)
        view.addSubview(topbar)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        topbarConstraints()
    }
    func topbarConstraints(){
        topbar.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        topbar.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        topbar.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        //topbar.widthAnchor.constraint(equalToConstant: 50).isActive = true
        topbar.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        collectionView?.topAnchor.constraint(equalTo: topbar.bottomAnchor,constant: 20).isActive = true
        collectionView?.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        collectionView?.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        collectionView?.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
   
    
    

}
extension MuseumViewController: UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MuseumsCardView
        let Museums = data
        cell.configure(label: "\(Museums[indexPath.row].title!)")
        cell.configure(with: Museums[indexPath.row].image!)
        cell.configure(phoneLabel: ": "+Museums[indexPath.row].phone!)
        cell.configure(labelSub:  ": "+Museums[indexPath.row].subTitle!)
        cell.configure(priceL: Museums[indexPath.row].price! )
        cell.delegate = self
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Select section \(indexPath.section) and row \(indexPath.row)")
        let Museums = data
        let vc = selectCardView()
        self.navigationController?.pushViewController(selectCardView(), animated: true)
        self.modalPresentationStyle = .formSheet
        vc.hotel_title = Museums[indexPath.item].title!
        vc.img.image = Museums[indexPath.item].image!
        //vc.img.image = Hotels[indexPath.row].images!
        vc.address_title = ": "+Museums[indexPath.item].subTitle!
        vc.phone_label = ": "+Museums[indexPath.item].phone!
        vc.price_label = ": \(Museums[indexPath.item].price!)€ per day"
        present(vc, animated: true)
    }
  
}

extension MuseumViewController: TopBarViewDelegate {
    func tappedMenu() {
        print("Hello")
    }
    func logoutAlert() {
        let viewController = LoginViewController()
        viewController.modalTransitionStyle = .crossDissolve
        viewController.modalPresentationStyle = .fullScreen

        let actionSheet = MDCActionSheetController(title: "Logout",
                                                   message: "Press Here if you want to logout!")
        let actionOne = MDCActionSheetAction(title: "Logout",
                                             image: UIImage(named: "logout_x20"),
                                             handler: { _ in self.present(viewController, animated: true)})
        actionSheet.addAction(actionOne)
        present(actionSheet, animated: true, completion: nil)
    }
    
}
extension MuseumViewController:MuseumCardDelegate {
    func hotelCardTapped(title:String,image:UIImage,subtitle:String,phone:String,price:Float) {
        print(title)
        let vc = selectCardView()
        self.navigationController?.pushViewController(vc, animated: true)
        self.modalPresentationStyle = .formSheet
        vc.hotel_title = title
        vc.img.image = image
        vc.address_title = subtitle
        vc.phone_label = phone
        vc.price_label = ": \(price)€ per day"
        present(vc, animated: true)
    }
    
 
}
