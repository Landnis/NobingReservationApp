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
    var subTitle: String?
    var phone: String?
    var image: UIImage?
    var price: Float?
}
//UIImageView(image: #imageLiteral(resourceName: "hotelApsis").withRenderingMode(.alwaysTemplate))
var dataSet = [

museumsModels(title: "Hotel Terelidis", subTitle:"14o km Ptolemaidas-Kastorias, Ptolemaida 502 00",phone:"+30 698 427 7344" , image: UIImage(named: "hotelTerelidis"),price: 30.0),
museumsModels(title: "Hotel Pantelidis",subTitle:"3okm ptolemaidas,Mpodosakio,Ptolemaida 502 00",phone:"+30 2463 053300" , image: UIImage(named: "hotelPantelidis"),price: 50.0),
museumsModels(title: "Hotel Iwannou",subTitle:"3οkm Ptolemaidas 502 00,Geniko Nosokomio Mpodosakio",phone:"+30 693 232 0104", image: UIImage(named: "hotelIoannou"),price: 40.0),
museumsModels(title: "Apsis Hotel",subTitle:"Emporio Eordaias",phone:"+30 2463 062201" ,image: UIImage(named: "hotelApsis"),price: 60.50),
museumsModels(title: "Villa Kastanodasos",subTitle:"Emporio Kozanis,Emborion 500 05",phone:"+30 2463 062275" ,image: UIImage(named: "villaKastanodasos"),price: 20.0),
museumsModels(title: "Hotel Kostis",subTitle:"Fillipou 6, Ptolemaida 50 200",phone:"+30 2463 026661",image: UIImage(named: "hotelKostis"),price: 25.0)
]
