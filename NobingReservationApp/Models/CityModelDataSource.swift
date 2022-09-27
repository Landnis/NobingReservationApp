//
//  cityModel.swift
//  NobingReservationApp
//
//  Created by Konstantinos Stergiannis on 23/9/22.
//

import UIKit

struct CityModel {
    var location: String?
    var image: UIImage?
    var description: String?
    var area:String?
    var population:Int?
}

var cityModelData = [

    CityModel(location: "Thessaloniki", image: UIImage(named: "Thessaloniki"), description: "Thessaloniki is a Greek port city on the Thermaic Gulf of the Aegean Sea. Evidence of Roman, Byzantine and Ottoman history remains, especially around Ano Poli, the upper town. The ruins of Roman Emperor Galerius’ 4th-century palace include the Rotunda that has been both a church and a mosque. Much of the city center was destroyed in the Great Fire of 1917. The rebuilt 20th-century city has a modern European layout.",area: "19307 km²",population: 1030338),
    CityModel(location: "Kozani", image: UIImage(named: "Kozani"), description: "Kozani is a city in northern Greece, capital of Kozani regional unit and of Western Macedonia. It is located in the western part of Macedonia, in the northern part of the Aliakmonas river valley.",area: "732.2 km²",population: 70000),
    CityModel(location: "Ptolemaida", image: UIImage(named: "Ptolemaida"), description: "Ptolemaida is a town and a former municipality in Kozani regional unit, Western Macedonia, Greece. Since the 2011 local government reform it is part of the municipality Eordaia, of which it is the seat and a municipal unit. It is known for its coal mines and its power stations.",area: "217.901 km²",population: 32142),
    CityModel(location: "Agios Athanasios", image: UIImage(named: "AgiosAthanasios"), description: "Agios Athanasios is a village in the Pella regional unit of Macedonia, Greece. The village is located north of Lake Vegoritida within the Vegoritida municipal unit which belongs to the municipality of Edessa.",area: "24,456 km²",population: 742)
    
]
