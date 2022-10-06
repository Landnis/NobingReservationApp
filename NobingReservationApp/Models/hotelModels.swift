//
//  Models.swift
//  NobingReservationApp
//
//  Created by Konstantinos Stergiannis on 2/8/22.
//

import Foundation
import UIKit

struct hotelModels {
    var title: String?
    var subTitle: String?
    var phone: String?
    var image: UIImage?
    var price: Float?
    var location: String?
}
struct hotelImages {
    var images:  [UIImage]?
    var title: String?
}

var hotelData = [

    hotelModels(title: "Hotel Terelidis", subTitle:"14o km Ptolemaidas-Kastorias, Ptolemaida 502 00",phone:"+30 698 427 7344" , image: UIImage(named: "hotelTerelidis"),price: 30.0,location:"Ptolemaida"),
hotelModels(title: "Hotel Pantelidis",subTitle:"3okm ptolemaidas,Mpodosakio,Ptolemaida 502 00",phone:"+30 2463 053300" , image: UIImage(named: "hotelPantelidis"),price: 50.0,location:"Ptolemaida"),
hotelModels(title: "Hotel Ioannou",subTitle:"3οkm Ptolemaidas 502 00,Geniko Nosokomio Mpodosakio",phone:"+30 693 232 0104", image: UIImage(named: "hotelIoannou"),price: 40.0,location:"Ptolemaida"),
hotelModels(title: "Apsis Hotel",subTitle:"Emporio Eordaias",phone:"+30 2463 062201" ,image: UIImage(named: "hotelApsis"),price: 60.50,location:"Kozani"),
hotelModels(title: "Villa Kastanodasos",subTitle:"Emporio Kozanis,Emborion 500 05",phone:"+30 2463 062275" ,image: UIImage(named: "villaKastanodasos"),price: 20.0,location:"Kozani"),
hotelModels(title: "Hotel Kostis",subTitle:"Fillipou 6, Ptolemaida 50 200",phone:"+30 2463 026661",image: UIImage(named: "hotelKostis"),price: 25.0,location:"Ptolemaida")
]

var dataImages = [
    hotelImages(images: [UIImage(named:"hotelTerelidis")!,UIImage(named:"hotelTerelidis2")!,UIImage(named:"hotelTerelidis3")!,UIImage(named:"hotelTerelidis4")!,UIImage(named:"hotelTerelidis5")!,UIImage(named:"hotelTerelidis6")!,UIImage(named:"hotelTerelidis7")!,UIImage(named:"hotelTerelidis8")!,UIImage(named:"hotelTerelidis9")!], title: "Hotel Terelidis"),
    hotelImages(images: [UIImage(named:"hotelPantelidis")!,UIImage(named:"hotelPantelidis2")!,UIImage(named:"hotelPantelidis3")!,UIImage(named:"hotelPantelidis4")!,UIImage(named:"hotelPantelidis5")!,UIImage(named:"hotelPantelidis6")!,UIImage(named:"hotelPantelidis7")!,UIImage(named:"hotelPantelidis8")!], title: "Hotel Pantelidis"),
    hotelImages(images: [UIImage(named:"hotelKostis")!,UIImage(named:"hotelKostis2")!,UIImage(named:"hotelKostis3")!,UIImage(named:"hotelKostis4")!,UIImage(named:"hotelKostis5")!,UIImage(named:"hotelKostis6")!,UIImage(named:"hotelKostis7")!,UIImage(named:"hotelKostis8")!], title: "Hotel Kostis"),
    hotelImages(images: [UIImage(named:"hotelIoannou")!,UIImage(named:"hotelIoannou2")!,UIImage(named:"hotelIoannou3")!,UIImage(named:"hotelIoannou4")!,UIImage(named:"hotelIoannou5")!,UIImage(named:"hotelIoannou6")!,UIImage(named:"hotelIoannou7")!,UIImage(named:"hotelIoannou8")!], title: "Hotel Ioannou"),
    hotelImages(images: [UIImage(named:"villaKastanodasos")!,UIImage(named:"villaKastanodasos2")!,UIImage(named:"villaKastanodasos3")!,UIImage(named:"villaKastanodasos4")!,UIImage(named:"villaKastanodasos5")!,UIImage(named:"villaKastanodasos6")!,UIImage(named:"villaKastanodasos7")!,UIImage(named:"villaKastanodasos8")!], title: "Villa Kastanodasos"),
    hotelImages(images: [UIImage(named:"hotelApsis")!,UIImage(named:"hotelApsis2")!,UIImage(named:"hotelApsis3")!,UIImage(named:"hotelApsis4")!,UIImage(named:"hotelApsis5")!,UIImage(named:"hotelApsis6")!,UIImage(named:"hotelApsis7")!,UIImage(named:"hotelApsis8")!,UIImage(named:"hotelApsis9")!], title: "Apsis Hotel")
]

