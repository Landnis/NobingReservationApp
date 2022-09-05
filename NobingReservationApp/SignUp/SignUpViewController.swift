//
//  SignUpViewController.swift
//  NobingReservationApp
//
//  Created by Konstantinos Stergiannis on 30/8/22.
//

import UIKit
import MaterialComponents.MaterialTabs_TabBarView
class SignUpViewController: UIViewController,AlertController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor().hexStringToUIColor(hex: "#f9dcc4")
        addSubviews(with: traitCollection)
        constraint(with: traitCollection)
        scrollView.addSubview(signupView)
        
    }
    lazy var signupView: SignUpView = {
        let view = SignUpView()
        view.backgroundColor = UIColor().hexStringToUIColor(hex: "#BED3F3")
        view.layer.shadowOffset = CGSize(width: 10, height: 10)
        view.layer.shadowRadius = 10
        view.layer.shadowOpacity = 0.5
        view.layer.cornerRadius = 15
        view.autoresizingMask = [.flexibleWidth, .flexibleBottomMargin]
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var scrollView: UIScrollView = {
        var view = UIScrollView(frame: .zero)
        view.backgroundColor = UIColor().hexStringToUIColor(hex: "#f9dcc4")
        //view.bounces = true
        //view.contentSize = self.view.bounds.size
        view.alwaysBounceHorizontal = false
        view.alwaysBounceVertical = true
        view.isDirectionalLockEnabled = true
        view.showsVerticalScrollIndicator = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        print("Changed")
        removeSubviews()
        addSubviews(with: traitCollection)
        constraint(with: traitCollection)
    }
    func addSubviews(with traitCollection: UITraitCollection){
        print("add")
        scrollView.addSubview(signupView)
        view.addSubview(scrollView)
    }

    
    func constraint(with traitCollection: UITraitCollection){
         signupView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor,constant: 25).isActive = true
         signupView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor).isActive = true
         signupView.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor,constant: -45).isActive = true
         signupView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor,constant: 20).isActive = true
         signupView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor).isActive = true
         signupView.heightAnchor.constraint(equalTo:scrollView.contentLayoutGuide.heightAnchor).isActive = true
                  
          scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
          scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
          scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
          scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

          if traitCollection.horizontalSizeClass == .regular &&
              traitCollection.verticalSizeClass == .regular {
             signupView.heightAnchor.constraint(equalToConstant: 700).isActive = true
              print(signupView.frame.size.height)

          } else if traitCollection.horizontalSizeClass == .regular && traitCollection.verticalSizeClass == .compact ||
                      (traitCollection.horizontalSizeClass == .compact && traitCollection.verticalSizeClass == .compact) {
              
              signupView.heightAnchor.constraint(equalToConstant: 450).isActive = true
              print(signupView.frame.size.height)
          }else {
              
              signupView.heightAnchor.constraint(equalToConstant: 600).isActive = true
              print(signupView.frame.size.height)
          }
}
    func removeSubviews(){
        scrollView.removeFromSuperview()
        signupView.removeFromSuperview()
    }
}

extension SignUpViewController: SignUpDelegate {
    func didTapSignUpButton(email: String?, firstPassword: String?, rewritePassword: String?) {
        guard
            let emailtext = email,
            let password = firstPassword,
            let identicalPass = rewritePassword
        else {
            return
        }
    
        if (emailtext.isEmpty && password.isEmpty && identicalPass.isEmpty){
            self.presentAlert(title: "Error", message: "Empty fields")
        }else if emailtext.isEmpty  {
            self.presentAlert(title: "Error", message: "Empty email field")
        }else if password.isEmpty {
            self.presentAlert(title: "Error", message: "Empty password field")
        }else if identicalPass.isEmpty {
            self.presentAlert(title: "Error", message: "Empty password field")
        }else if password.count < 8 || identicalPass.count < 8{
            self.presentAlert(title: "Error", message: "Password must be 8 letter and more!!")
        }else if password != identicalPass{
            self.presentAlert(title: "Error", message: "Passwords don't match")
        } else{
            let viewController = HomeViewController()
            viewController.modalTransitionStyle = .crossDissolve
            viewController.modalPresentationStyle = .fullScreen
            self.present(viewController, animated: true)
        }
    }
}

