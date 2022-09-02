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
        //view.addSubview(topbar)
        view.addSubview(scrollView)
        scrollView.addSubview(topbar)
        topbarConstraint()
    }
    
    lazy var scrollView: UIScrollView = {
        var view = UIScrollView(frame: .zero)
        view.backgroundColor = .red
        view.frame = self.view.bounds
        view.autoresizingMask = .flexibleHeight
        view.bounces = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
   lazy var topbar: TopBarView = {
        var topBar = TopBarView()
        topBar.translatesAutoresizingMaskIntoConstraints = false
        return topBar
    }()
    override func viewDidAppear(_ animated: Bool) {
        scrollView.contentSize = CGSize(width: view.frame.size.width, height: 2000)
    }
    
    func topbarConstraint(){
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

        topbar.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor,constant: 16).isActive = true
        topbar.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor,constant: 16).isActive = true
        topbar.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor,constant: -16).isActive = true
        topbar.widthAnchor.constraint(equalToConstant: 550).isActive = true
        topbar.heightAnchor.constraint(equalToConstant: 500).isActive = true
    }
}
