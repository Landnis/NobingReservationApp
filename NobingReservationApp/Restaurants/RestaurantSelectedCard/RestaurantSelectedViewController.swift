//
//  RestaurantSelectedViewController.swift
//  NobingReservationApp
//
//  Created by Konstantinos Stergiannis on 29/8/22.
//

import Foundation
import UIKit
import MaterialComponents
class RestaurantSelectedViewController: UIViewController {
    
var img = UIImageView()
var restaurant_title:String = ""
var address_title:String = ""
var phone_label:String = ""
var price_label:String = ""
var collectionView: UICollectionView?
var restaurantTitle = restaurantData.map({$0.title})
var restaurantImages = restaurantDataImages.map({$0.images})
let datePicker = UIDatePicker()

var selectedCard: UIView = {
    let card = UIView()
   card.backgroundColor = UIColor().hexStringToUIColor(hex: "#BED3F3")
   card.layer.shadowOffset = CGSize(width: 10, height: 10)
   card.layer.shadowRadius = 10
   card.layer.shadowOpacity = 0.5
   card.layer.cornerRadius = 15
   card.translatesAutoresizingMaskIntoConstraints = false
    return card
}()
lazy var nextIcon: UIImageView = {
    let imageView = UIImageView(image: #imageLiteral(resourceName: "nextArrow_x20").withTintColor(.lightGray))
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
}()
lazy var previousIcon: UIImageView = {
    let imageView =  UIImageView(image: #imageLiteral(resourceName: "previousArrow_x20").withTintColor(.lightGray))
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
}()

    lazy var nextView: UIView = {
        let view = UIView()
        view.backgroundColor = .darkGray
        view.alpha = 0.50
        view.layer.cornerRadius = 15
        view.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
            
    lazy var previousView: UIView = {
        let view = UIView()
        view.backgroundColor = .darkGray
        view.alpha = 0.50
        view.layer.cornerRadius = 15
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]

        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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
lazy var titleStackView: UIStackView = {
    let stackView = UIStackView(arrangedSubviews: [titleLabel,verifiedIcon])
    stackView.axis = .horizontal
    stackView.spacing = 5.0
    //stackView.distribution = .fillEqually
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

lazy var txtDatePicker: UITextField = {
    let text = UITextField()
    text.translatesAutoresizingMaskIntoConstraints = false
    return text
}()
    
override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor().hexStringToUIColor(hex: "#457b9d")
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    collectionView = UICollectionView(frame: .zero,collectionViewLayout: layout)
    guard let collectionView = collectionView else {
        return
    }
    collectionView.register(SelectedCardImage.self, forCellWithReuseIdentifier: "cell")
    //layout.itemSize = CGSize(width: 350, height: 200)
    layout.minimumInteritemSpacing = 30.0
    layout.minimumLineSpacing = 30.0
    collectionView.delegate = self
    collectionView.dataSource = self
    collectionView.layer.cornerRadius = 15
    collectionView.backgroundColor = UIColor().hexStringToUIColor(hex: "#BED3F3")
    collectionView.frame = view.bounds
    view.addSubview(selectedCard)
    view.addSubview(closeButton)
    //selectedCard.addSubview(Image)
    selectedCard.addSubview(titleStackView)
    selectedCard.addSubview(addressIcon)
    selectedCard.addSubview(addressLabel)
    selectedCard.addSubview(cardStackView)
    selectedCard.addSubview(collectionView)
    selectedCard.addSubview(nextView)
    selectedCard.addSubview(previousView)
    //selectedCard.addSubview(datePicker)
    nextView.addSubview(nextIcon)
    previousView.addSubview(previousIcon)
    titleLabel.text = restaurant_title
    //Image.image = img.image
    addressLabel.text = address_title
    phoneLabel.text = phone_label
    priceLabel.text = price_label
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    constraintLayout()
    //showDatePicker()
}
    
    func showDatePicker(){
        //Formate Date
        datePicker.datePickerMode = .date

       //ToolBar
       let toolbar = UIToolbar();
       toolbar.sizeToFit()
       let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(donedatePicker));
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
      let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker));

     toolbar.setItems([doneButton,spaceButton,cancelButton], animated: false)

      txtDatePicker.inputAccessoryView = toolbar
      txtDatePicker.inputView = datePicker

     }
    @objc func donedatePicker(){

      let formatter = DateFormatter()
      formatter.dateFormat = "dd/MM/yyyy"
      txtDatePicker.text = formatter.string(from: datePicker.date)
      self.view.endEditing(true)
    }

    @objc func cancelDatePicker(){
       self.view.endEditing(true)
    }
func constraintLayout() {
    selectedCard.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100).isActive = true
    selectedCard.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
    selectedCard.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
    selectedCard.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -30).isActive = true

    closeButton.topAnchor.constraint(equalTo: view.topAnchor,constant: 20).isActive = true
    closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -15).isActive = true

    collectionView?.topAnchor.constraint(equalTo: selectedCard.topAnchor).isActive = true
    collectionView?.leadingAnchor.constraint(equalTo: selectedCard.leadingAnchor).isActive = true
    collectionView?.trailingAnchor.constraint(equalTo: selectedCard.trailingAnchor).isActive = true
    collectionView?.bottomAnchor.constraint(equalTo: selectedCard.centerYAnchor,constant: -30).isActive = true
    
    nextView.topAnchor.constraint(equalTo: collectionView!.topAnchor).isActive = true
    nextView.bottomAnchor.constraint(equalTo: collectionView!.bottomAnchor).isActive = true
    nextView.trailingAnchor.constraint(equalTo: collectionView!.trailingAnchor).isActive = true
    nextView.widthAnchor.constraint(equalToConstant: 25).isActive = true
    
    previousView.topAnchor.constraint(equalTo: collectionView!.topAnchor).isActive = true
    previousView.bottomAnchor.constraint(equalTo: collectionView!.bottomAnchor).isActive = true
    previousView.leadingAnchor.constraint(equalTo: collectionView!.leadingAnchor).isActive = true
    previousView.widthAnchor.constraint(equalToConstant: 25).isActive = true
    
    nextIcon.trailingAnchor.constraint(equalTo: collectionView!.trailingAnchor).isActive = true
    nextIcon.bottomAnchor.constraint(equalTo: collectionView!.centerYAnchor).isActive = true
    
    previousIcon.leadingAnchor.constraint(equalTo: collectionView!.leadingAnchor).isActive = true
    previousIcon.bottomAnchor.constraint(equalTo: collectionView!.centerYAnchor).isActive = true
    
    titleStackView.topAnchor.constraint(equalTo:  collectionView!.bottomAnchor,constant: 20).isActive = true
    titleStackView.leadingAnchor.constraint(equalTo:  collectionView!.leadingAnchor,constant: collectionView!.frame.size.width/3-20).isActive = true
    titleStackView.trailingAnchor.constraint(equalTo:  collectionView!.trailingAnchor).isActive = true
    
    addressIcon.topAnchor.constraint(equalTo: titleStackView.bottomAnchor,constant: 20).isActive = true
    addressIcon.leadingAnchor.constraint(equalTo: collectionView!.leadingAnchor).isActive = true
    
    addressLabel.topAnchor.constraint(equalTo: addressIcon.topAnchor).isActive = true
    addressLabel.leadingAnchor.constraint(equalTo: addressIcon.leadingAnchor,constant: 25).isActive = true
    addressLabel.trailingAnchor.constraint(equalTo: collectionView!.trailingAnchor).isActive = true
    
    cardStackView.topAnchor.constraint(equalTo: addressLabel.bottomAnchor,constant: 15).isActive = true
    cardStackView.leadingAnchor.constraint(equalTo: collectionView!.leadingAnchor).isActive = true
    cardStackView.trailingAnchor.constraint(equalTo: collectionView!.trailingAnchor).isActive = true

}

}
extension RestaurantSelectedViewController: UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
   // let i = imageTitle.firstIndex(of: titleLabel.text)!
   // return imagesNames[i]!.count
    let i = restaurantTitle.firstIndex(of: titleLabel.text)!
    return restaurantImages[i]!.count
}

func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! SelectedCardImage
    let restaurants = restaurantDataImages
    let i = restaurantTitle.firstIndex(of: titleLabel.text)!
    cell.Image.image = restaurants[i].images![indexPath.row]
    cell.layer.cornerRadius = 15
    return cell
}

func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    print("Select section \(indexPath.section) and row \(indexPath.row)")

}
func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: selectedCard.frame.size.width, height: selectedCard.frame.size.width)
}
    
}
