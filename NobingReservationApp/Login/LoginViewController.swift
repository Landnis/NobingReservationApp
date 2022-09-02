//
//  LoginViewController.swift
//  NobingReservationApp
//
//  Created by Konstantinos Stergiannis on 1/8/22.
//

import UIKit
import MaterialComponents.MaterialTextControls_FilledTextFields
import MaterialComponents.MaterialTextControls_FilledTextFieldsTheming
import MaterialComponents.MaterialTextControls_OutlinedTextFields
import MaterialComponents.MaterialTextControls_OutlinedTextAreas
import MaterialComponents.MaterialButtons
import MaterialComponents.MaterialButtons_Theming
import MaterialComponents.MaterialTabs_TabBarView
class LoginViewController: UIViewController, AlertController{

    //lazy var contentViewSize = CGSize(width: self.view.frame.width, height: self.view.frame.height + 800)
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor().hexStringToUIColor(hex: "#f9dcc4")
        view.addSubview(scrollView)
        scrollView.addSubview(loginView)
        
        self.loginView.delegate = self
        constraint()

    }
    
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
 
    var loginView: LoginView  = {
        let loginView = LoginView()
        loginView.backgroundColor = UIColor().hexStringToUIColor(hex: "#BED3F3")
        loginView.layer.shadowOffset = CGSize(width: 10, height: 10)
        loginView.layer.shadowRadius = 10
        loginView.layer.shadowOpacity = 0.5
        loginView.layer.cornerRadius = 15
        loginView.autoresizingMask = [.flexibleWidth, .flexibleBottomMargin]
        loginView.translatesAutoresizingMaskIntoConstraints = false
        return loginView
    }()
    
    func constraint(){
        
        loginView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor,constant: 25).isActive = true
        loginView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor).isActive = true
        loginView.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor,constant: -45).isActive = true
        loginView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor,constant: 20).isActive = true
        loginView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor).isActive = true
        loginView.heightAnchor.constraint(equalTo:scrollView.contentLayoutGuide.heightAnchor).isActive = true
                
        scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true

        if traitCollection.horizontalSizeClass == .regular &&
            traitCollection.verticalSizeClass == .regular {
            loginView.heightAnchor.constraint(equalToConstant: 300).isActive = true

        } else if traitCollection.horizontalSizeClass == .regular && traitCollection.verticalSizeClass == .compact ||
                    (traitCollection.horizontalSizeClass == .compact && traitCollection.verticalSizeClass == .compact) {
            
            loginView.heightAnchor.constraint(equalToConstant: 400).isActive = true
            
        }else{
            
            loginView.heightAnchor.constraint(equalToConstant: 500).isActive = true

        }
      }
}

extension LoginViewController : LoginViewDelegate {
   
    func didTappedLoginButton(usernameText:String?,passwordText:String?) {
      
        guard
            let username = usernameText,
            let password = passwordText
        else {
            return
        }
    
        if (username.isEmpty && password.isEmpty){
            self.presentAlert(title: "Error", message: "Empty fields")
        }else if username.isEmpty {
            self.presentAlert(title: "Error", message: "Empty username field")
        }else if password.isEmpty {
            self.presentAlert(title: "Error", message: "Empty password field")
        }else if password.count < 8 {
            self.presentAlert(title: "Error", message: "Password must be 8 letter and more!!")
        } else{
            let viewController = HomeViewController()
            viewController.modalTransitionStyle = .crossDissolve
            viewController.modalPresentationStyle = .fullScreen
            self.present(viewController, animated: true)
        }
    }
    
    
}

