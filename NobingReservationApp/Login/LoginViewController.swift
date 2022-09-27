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
        addSubviews(with: traitCollection)
        constraint(with: traitCollection)
        self.loginView.delegate = self
    }
    
    lazy var scrollView: UIScrollView = {
        var view = UIScrollView(frame: .zero)
        view.backgroundColor = UIColor().hexStringToUIColor(hex: "#f9dcc4")
        view.autoresizingMask = .flexibleHeight
        //view.showsHorizontalScrollIndicator = true
        view.bounces = true
        view.contentSize = self.view.bounds.size
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
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        print("Changed")
        removeSubviews()
        addSubviews(with: traitCollection)
        constraint(with: traitCollection)
    }
    func addSubviews(with traitCollection: UITraitCollection){
        print("add")
        scrollView.addSubview(loginView)
        view.addSubview(scrollView)
    }
  
    
    func constraint(with traitCollection: UITraitCollection){
       loginView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor,constant: 25).isActive = true
       loginView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor).isActive = true
       loginView.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor,constant: -45).isActive = true
       loginView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor,constant: 20).isActive = true
       loginView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor).isActive = true
       loginView.heightAnchor.constraint(equalTo:scrollView.contentLayoutGuide.heightAnchor).isActive = true
                  
          scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
          scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
          scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
          scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

          if traitCollection.horizontalSizeClass == .regular &&
              traitCollection.verticalSizeClass == .regular {
             loginView.heightAnchor.constraint(equalToConstant: 700).isActive = true
              print(loginView.frame.size.height)

          } else if traitCollection.horizontalSizeClass == .regular && traitCollection.verticalSizeClass == .compact ||
                      (traitCollection.horizontalSizeClass == .compact && traitCollection.verticalSizeClass == .compact) {
              
              loginView.heightAnchor.constraint(equalToConstant: 400).isActive = true
              print(loginView.frame.size.height)
          }else {
              
              loginView.heightAnchor.constraint(equalToConstant: 600).isActive = true
              print(loginView.frame.size.height)
          }
        
    }
    func removeSubviews() {
        print("remove")
        loginView.removeFromSuperview()
        scrollView.removeFromSuperview()
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
        if username == "Kostas.stergiannis" {
            self.presentAlert(title: "Error", message: "Write another username")
            self.loginView.stop()
        } else if password.count < 8 {
            self.presentAlert(title: "Error", message: "Password must be 8 letter and more!!")
            self.loginView.passwordTextField.text = ""
            self.loginView.stop()
        } else{
            
            let viewController = BottomBarViewController()
            viewController.modalTransitionStyle = .crossDissolve
            viewController.modalPresentationStyle = .fullScreen
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                self.present(viewController, animated: true)
            }
            
        }
    }
    
    func didTappedForgotButton() {
        let viewController = ForgotPasswordViewController()
        viewController.modalTransitionStyle = .crossDissolve
        viewController.modalPresentationStyle = .formSheet
        self.present(viewController, animated: true)
    }
}

