//
//  museumsModel.swift
//  NobingReservationApp
//
//  Created by Konstantinos Stergiannis on 19/8/22.
//

import Foundation
import UIKit

struct museumsModels {
    var title: String?
    var address: String?
    var phone: String?
    var image: UIImage?
    var price: Float?
    var location: String?
}
struct museumImages {
    var images:  [UIImage]?
    var title: String?
}
//UIImageView(image: #imageLiteral(resourceName: "hotelApsis").withRenderingMode(.alwaysTemplate))
var dataSet = [

    museumsModels(title: "Historical-Folklore Museum of Kozani", address:"Ionos Dragoumi 9-11,Kozani",phone:"+30 2461033978" , image: UIImage(named: "museumKozani"),price: 0,location: "Kozani"),
    museumsModels(title: "Museum of Byzantine Culture",address:"leoforos stratou 2,546 Thessaloniki",phone:"+30 2313-306400" , image: UIImage(named: "museumThessaloniki"),price: 8,location: "Thessaloniki"),
    museumsModels(title: "Museum of the Royal Tombs of Vergina",address:"Imathia,Vergina 590 31",phone:"+30 23310 92347", image: UIImage(named: "museumVergina"),price: 12,location: "Vergina"),
    museumsModels(title: "Archaeological Museum of Thessaloniki",address:"Manoli Andronikou 6,54013",phone:"+30 2467 028603" ,image: UIImage(named: "museumArcheological3"),price: 8,location: "Thessaloniki"),
    museumsModels(title: "Archaeological Museum of Pella",address:"35klm thessaloniki-edessa,Pella",phone:"+30 2382 031160" ,image: UIImage(named: "villaKastanodasos"),price: 8,location: "Pella")
]

var dataMuseumsImages = [
    museumImages(images: [UIImage(named:"museumKozani")!,UIImage(named:"museumKozani1")!,UIImage(named:"museumKozani2")!,UIImage(named:"museumKozani3")!,UIImage(named:"museumKozani4")!], title: "Historical-Folklore Museum of Kozani"),
    museumImages(images: [UIImage(named:"museumThessaloniki")!,UIImage(named:"museumThessaloniki1")!,UIImage(named:"museumThessaloniki2")!,UIImage(named:"museumThessaloniki3")!,UIImage(named:"museumThessaloniki4")!], title: "Museum of Byzantine Culture"),
    museumImages(images: [UIImage(named:"museumVergina")!,UIImage(named:"museumVergina1")!,UIImage(named:"museumVergina2")!,UIImage(named:"museumVergina3")!], title: "Museum of the Royal Tombs of Vergina"),
    museumImages(images: [UIImage(named:"museumArcheological3")!,UIImage(named:"museumArcheological")!,UIImage(named:"museumArcheological1")!,UIImage(named:"museumArcheological2")!], title: "Archaeological Museum of Thessaloniki"),
    museumImages(images: [UIImage(named:"museumPellas")!,UIImage(named:"museumPellas1")!,UIImage(named:"museumPellas2")!,UIImage(named:"museumPellas3")!], title: "Archaeological Museum of Pella"),
]
