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
        loginView.addSubview(titleLabel)
        loginView.addSubview(formStackView)
        loginView.addSubview(loginButton)
        constraint()

    }
    var loginView: UIView  = {
        let loginView = UIView()
        loginView.backgroundColor = UIColor().hexStringToUIColor(hex: "#BED3F3")
        loginView.layer.shadowOffset = CGSize(width: 10, height: 10)
        loginView.layer.shadowRadius = 10
        loginView.layer.shadowOpacity = 0.5
        loginView.layer.cornerRadius = 15
        loginView.autoresizingMask = [.flexibleWidth, .flexibleBottomMargin]
        loginView.translatesAutoresizingMaskIntoConstraints = false
        return loginView
        
    }()
    
    var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "Log In"
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont(name: "HelveticaNeue-UltraLight", size: 25.0)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()
    
    lazy var usernameTextField: MDCFilledTextField = {
        let textField = MDCFilledTextField()
        let containerScheme = MDCContainerScheme()
        textField.applyTheme(withScheme: containerScheme)
        textField.label.text = "Username or email"
        textField.textContentType = .username
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.leftViewMode = .always
        textField.layer.cornerRadius = 20
        textField.leftView = UIImageView(image: #imageLiteral(resourceName: "person_x20").withRenderingMode(.alwaysTemplate))
        textField.leftView?.tintColor = UIColor().hexStringToUIColor(hex: "#495057")
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
  lazy var passwordTextField: MDCFilledTextField = {
       let textField = MDCFilledTextField(frame: .zero)
        let containerScheme = MDCContainerScheme()
        textField.applyTheme(withScheme: containerScheme)
       // textField.setFilledBackgroundColor(UIColor().hexStringToUIColor(hex: "#e5e5e5"), for: .normal)
        //textField.setFilledBackgroundColor(UIColor().hexStringToUIColor(hex: "#e5383b"), for: .editing)
        textField.label.text = "Password"
        textField.textContentType = .password
        textField.isSecureTextEntry = true
        textField.leftViewMode = .always
        textField.leftView = UIImageView(image: #imageLiteral(resourceName: "lock_x20").withRenderingMode(.alwaysTemplate))
        textField.leftView?.tintColor = UIColor().hexStringToUIColor(hex: "#495057")
        textField.rightViewMode = .always
        textField.trailingView = passwordShowHideButton
        textField.rightView?.tintColor = UIColor().hexStringToUIColor(hex: "#495057")
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
   lazy var formStackView: UIStackView = {
       let stackView = UIStackView(arrangedSubviews: [usernameTextField,passwordTextField])
        stackView.axis = .vertical
        stackView.spacing = 25.0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    lazy var loginButton: MDCButton = {
        let button = MDCButton()
        let containerScheme = MDCContainerScheme()
        button.applyContainedTheme(withScheme: containerScheme )
        button.setTitle("Login", for: .normal)
        button.layer.cornerRadius = 15
        button.backgroundColor = UIColor().hexStringToUIColor(hex: "#495057")
        button.addTarget(self, action: #selector(loginButtonTouchUpInsideHandler(_:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var passwordShowHideButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 24, height: 24))
        button.setImage(#imageLiteral(resourceName: "onvisibility_x20").withRenderingMode(.alwaysTemplate), for: .normal)
        button.setImage(#imageLiteral(resourceName: "outlinevisibility_x20").withRenderingMode(.alwaysTemplate), for: .selected)
        button.addTarget(self, action: #selector(passwordShowHideButtonTouchUpInsideHandler(_:)), for: .touchUpInside)
        return button
    }()
    
    
    @objc func passwordShowHideButtonTouchUpInsideHandler(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        
        if sender == passwordShowHideButton {
            passwordTextField.isSecureTextEntry = !sender.isSelected
        } else if sender == passwordShowHideButton {
            passwordTextField.isSecureTextEntry = !sender.isSelected
        }
    }
    
    
    @objc func loginButtonTouchUpInsideHandler(_ sender: UIButton){
        guard
            let username = usernameTextField.text,
            let password = passwordTextField.text
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

    func constraint(){
        titleLabel.centerXAnchor.constraint(equalTo: loginView.centerXAnchor).isActive = true
        formStackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 50).isActive = true
        formStackView.leadingAnchor.constraint(equalTo: loginView.leadingAnchor, constant: 20).isActive = true
        formStackView.trailingAnchor.constraint(equalTo: loginView.trailingAnchor, constant: -20).isActive = true
        loginButton.topAnchor.constraint(equalTo: formStackView.bottomAnchor, constant: 20).isActive = true
        loginButton.leadingAnchor.constraint(equalTo: formStackView.leadingAnchor).isActive = true
        loginButton.trailingAnchor.constraint(equalTo: formStackView.trailingAnchor).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        

        if traitCollection.horizontalSizeClass == .regular &&
            traitCollection.verticalSizeClass == .regular {
            loginView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
            loginView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
            loginView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
            loginView.widthAnchor.constraint(equalToConstant: 550).isActive = true
            loginView.heightAnchor.constraint(equalToConstant: 250).isActive = true
        } else if traitCollection.horizontalSizeClass == .regular && traitCollection.verticalSizeClass == .compact ||
                    (traitCollection.horizontalSizeClass == .compact && traitCollection.verticalSizeClass == .compact) {
            loginView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 500).isActive = true
            loginView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25).isActive = true
            loginView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25).isActive = true
            loginView.widthAnchor.constraint(equalToConstant: 450).isActive = true
            loginView.heightAnchor.constraint(equalToConstant: 350).isActive = true
        }else{
            loginView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 150).isActive = true
            loginView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
            loginView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
            loginView.widthAnchor.constraint(equalToConstant: 350).isActive = true
            loginView.heightAnchor.constraint(equalToConstant: 450).isActive = true
            
        }
    }

}
