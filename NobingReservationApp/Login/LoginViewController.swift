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
       
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor().hexStringToUIColor(hex: "#f9dcc4")
        view.addSubview(loginView)
        self.loginView.delegate = self

        constraint()

    }
    
    lazy var signup: SignUpView = {
        let vc = SignUpView()
        vc.translatesAutoresizingMaskIntoConstraints = false
        return vc
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
        
        if traitCollection.horizontalSizeClass == .regular &&
            traitCollection.verticalSizeClass == .regular {
            
            loginView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
            loginView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
            loginView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
            loginView.widthAnchor.constraint(equalToConstant: 550).isActive = true
            loginView.heightAnchor.constraint(equalToConstant: 250).isActive = true
            
        } else if traitCollection.horizontalSizeClass == .regular && traitCollection.verticalSizeClass == .compact ||
                    (traitCollection.horizontalSizeClass == .compact && traitCollection.verticalSizeClass == .compact) {
            loginView.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
            loginView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25).isActive = true
            loginView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25).isActive = true
            loginView.widthAnchor.constraint(equalToConstant: 450).isActive = true
            loginView.heightAnchor.constraint(equalToConstant: 350).isActive = true

        }else{
            loginView.topAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive = true
            loginView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
            loginView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
            loginView.widthAnchor.constraint(equalToConstant: 350).isActive = true
            loginView.heightAnchor.constraint(equalToConstant: 450).isActive = true
            
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

