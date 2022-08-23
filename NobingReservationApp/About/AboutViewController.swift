//
//  AboutViewController.swift
//  NobingReservationApp
//
//  Created by Konstantinos Stergiannis on 18/8/22.
//

import UIKit

class AboutViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        view.addSubview(topbar)
        topbarConstraint()
    }
    var topbar: TopBarView = {
        let topBar = TopBarView()
        topBar.translatesAutoresizingMaskIntoConstraints = false
        return topBar
    }()
    
    func topbarConstraint(){
    topbar.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    topbar.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    topbar.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    //topbar.widthAnchor.constraint(equalToConstant: 50).isActive = true
    topbar.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
}
