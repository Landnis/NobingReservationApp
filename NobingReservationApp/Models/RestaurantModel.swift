//
//  RestaurantModel.swift
//  NobingReservationApp
//
//  Created by Konstantinos Stergiannis on 29/8/22.
//

import Foundation
import UIKit
struct restaurantModels {
    var title: String?
    var address: String?
    var phone: String?
    var image: UIImage?
    var price: Float?
    var location: String?
}
struct restaurantImages {
    var images:  [UIImage]?
    var title: String?
}
//UIImageView(image: #imageLiteral(resourceName: "hotelApsis").withRenderingMode(.alwaysTemplate))
var restaurantData = [

    restaurantModels (title: "Marea Sea Spirit", address:"13 Margariti Lori Kallari,Thessaloniki 546 22",phone:"+30 231 025 7696" , image: UIImage(named: "RestaurantThessaloniki"),price: 20.0,location: "Thessaloniki"),
    restaurantModels (title: "Strada",address:"4 Mourati,Kozani 501 00",phone:"+30 2461 041815" , image: UIImage(named: "RestaurantKozani"),price: 15.0,location: "Kozani"),
    restaurantModels (title: "Taverna Dionisos",address:"Orma 584 00",phone:"+30 2384 094410", image: UIImage(named: "RestaurantDionisos"),price: 12.0,location:"Pella"),
    restaurantModels (title: "Molos Fish Resto",address:"Olumpou 1,Paralia Katerinis 60100",phone:"+30 2351 064052" ,image: UIImage(named: "RestaurantKaterini"),price: 25.50,location:"Katerini"),
    restaurantModels (title: "Sta Kala Kathoumena",address:"54 Agnostou Stratioti, Polichni 565 33",phone:"+30 231 060 7881" ,image: UIImage(named: "RestaurantPolixni"),price: 20.0,location:"Thessaloniki")
]

var restaurantDataImages = [
    restaurantImages(images: [UIImage(named:"RestaurantThessaloniki")!,UIImage(named:"RestaurantThessaloniki2")!,UIImage(named:"RestaurantThessaloniki3")!,UIImage(named:"RestaurantThessaloniki4")!,UIImage(named:"RestaurantThessaloniki5")!], title: "Marea Sea Spirit"),
    restaurantImages(images: [UIImage(named:"RestaurantKozani")!,UIImage(named:"RestaurantKozani2")!,UIImage(named:"RestaurantKozani3")!,UIImage(named:"RestaurantKozani4")!,UIImage(named:"RestaurantKozani5")!], title: "Strada"),
    restaurantImages(images: [UIImage(named:"RestaurantDionisos")!,UIImage(named:"RestaurantDionisos2")!,UIImage(named:"RestaurantDionisos3")!,UIImage(named:"RestaurantDionisos4")!], title: "Taverna Dionisos"),
    restaurantImages(images: [UIImage(named:"RestaurantKaterini")!,UIImage(named:"RestaurantKaterini2")!,UIImage(named:"RestaurantKaterini3")!,UIImage(named:"RestaurantKaterini4")!,UIImage(named:"RestaurantKaterini5")!], title: "Molos Fish Resto"),
    restaurantImages(images: [UIImage(named:"RestaurantPolixni")!,UIImage(named:"RestaurantPolixni2")!,UIImage(named:"RestaurantPolixni3")!,UIImage(named:"RestaurantPolixni4")!,UIImage(named:"RestaurantPolixni5")!], title: "Sta Kala Kathoumena")
]
