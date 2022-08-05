//
//  MenuViewController.swift
//  NobingReservationApp
//
//  Created by Konstantinos Stergiannis on 3/8/22.
//

import Foundation
import UIKit

protocol MenuControllerDelegate {
    func didSelectMenuItems(named: SideMenuItem)
}
enum SideMenuItem: String,CaseIterable {
    case home = "Home"
    case hotels = "Hotels"
    case carRent = "CarRent"
    case restaurants = "Restaurants"
    case museums = "Museums"
    case info = "Info"
    case about = "About"
    case contact = "Contact"
    
    var image: String {
            switch self {
                case .home:
                    return "home_x20"
                case .hotels:
                    return "hotel_x20"
                case .carRent:
                    return "car_x20"
                case .restaurants:
                    return "restaurant_x20"
                case .museums:
                    return "museum_x20"
                case .info:
                    return "info_x20"
                case .about:
                    return "contact_x20"
                case .contact:
                    return "contact_x20"
            }
        }
}

class MenuViewController: UITableViewController {
    
    public var delegate:MenuControllerDelegate?
    private let menuItems: [SideMenuItem]
    
    init(with menuItems: [SideMenuItem]){
        self.menuItems = menuItems
        super.init(nibName: nil, bundle: nil)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = .darkGray
        //view.layer.shadowOpacity = 20
        //view.clipsToBounds = true
        view.backgroundColor = UIColor().hexStringToUIColor(hex: "#1d3557")
        
    }
    //Table
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) 
        cell.textLabel?.text = menuItems[indexPath.row].rawValue
        cell.textLabel?.textColor = .white
        cell.contentView.backgroundColor = UIColor().hexStringToUIColor(hex: "#1d3557")
        cell.imageView?.image = UIImage(named:SideMenuItem.allCases[indexPath.row].image)?.withTintColor(.systemBackground)
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let selectedItem =  menuItems[indexPath.row]
        delegate?.didSelectMenuItems(named: selectedItem)
    }
}
