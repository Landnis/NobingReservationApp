//
//  CarRentalModel.swift
//  NobingReservationApp
//
//  Created by Konstantinos Stergiannis on 29/8/22.
//

import Foundation
import UIKit

struct carRentalModels {
    var title: String?
    var address: String?
    var phone: String?
    var image: UIImage?
    var price: Float?
    var location: String?
}
struct carRentalImages {
    var images:  [UIImage]?
    var title: String?
}
//UIImageView(image: #imageLiteral(resourceName: "hotelApsis").withRenderingMode(.alwaysTemplate))
var carRentalData = [

    carRentalModels(title: "Alpha Drive Rent a Car", address:"Eth.Antistaseos 83,Thessaloniki 551 34",phone:"+30 231 044 7878" , image: UIImage(named: "carRentalThessaloniki"),price: 20,location: "Thessaloniki"),
    carRentalModels(title: "Simply Rent a Car",address:"Kozani,leo.Agiou Konstantinou 33",phone:"+30 6944 630 400" , image: UIImage(named: "carRentalKozani"),price: 28,location: "Kozani"),
    carRentalModels(title: "ACTION Rent a Car",address:"Kallithea 630 77",phone:"+30 2374020604", image: UIImage(named: "carRentalXalkidiki"),price: 30,location: "Xalkidiki"),
    carRentalModels(title: "TZIMAS EXPRESS",address:"Navarinou 18,Katerini 601 32",phone:"+30 2351 034250" ,image: UIImage(named: "CarRentalKaterini"),price: 40,location: "Katerini")
]

var carRentalDataImages = [
    carRentalImages(images: [UIImage(named:"carRentalThessaloniki")!,UIImage(named:"carRental2")!,UIImage(named:"carRental3")!,UIImage(named:"carRental4")!,UIImage(named:"carRental5")!,UIImage(named: "carRental6")!], title: "Alpha Drive Rent a Car"),
    carRentalImages(images: [UIImage(named:"carRentalKozani")!,UIImage(named:"carRental2")!,UIImage(named:"carRental3")!,UIImage(named:"carRental4")!,UIImage(named:"carRental5")!,UIImage(named: "carRental6")!], title: "Simply Rent a Car"),
    carRentalImages(images: [UIImage(named:"carRentalXalkidiki")!,UIImage(named:"carRental2")!,UIImage(named:"carRental3")!,UIImage(named:"carRental4")!,UIImage(named:"carRental5")!,UIImage(named: "carRental6")!], title: "ACTION Rent a Car"),
    carRentalImages(images: [UIImage(named:"CarRentalKaterini")!,UIImage(named:"carRental2")!,UIImage(named:"carRental3")!,UIImage(named:"carRental4")!,UIImage(named:"carRental5")!,UIImage(named: "carRental6")!], title: "TZIMAS EXPRESS")
]
