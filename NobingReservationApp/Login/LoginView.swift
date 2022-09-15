//
//  LoginView.swift
//  NobingReservationApp
//
//  Created by Konstantinos Stergiannis on 30/8/22.
//

import Foundation
import UIKit
import MaterialComponents.MaterialTextControls_FilledTextFields
import MaterialComponents.MaterialTextControls_FilledTextFieldsTheming
import MaterialComponents.MaterialTextControls_OutlinedTextFields
import MaterialComponents.MaterialTextControls_OutlinedTextAreas
import MaterialComponents.MaterialButtons
import MaterialComponents.MaterialButtons_Theming
import MaterialComponents.MaterialTabs_TabBarView
import MaterialComponents.MaterialActivityIndicator
protocol LoginViewDelegate: AnyObject {
    func didTappedLoginButton(usernameText:String?,passwordText:String?)
}

class LoginView: UIView {
    var delegate: LoginViewDelegate?
    
    var loginLabel: UILabel = {
        var label = UILabel()
        label.backgroundColor = .clear
        label.sizeToFit()
        label.text = "Log In"
        label.textAlignment = .center
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont(name: "HelveticaNeue-UltraLight", size: 40)
        label.setContentHuggingPriority(.defaultHigh, for: .vertical)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var forgοtPasswordButton: MDCButton = {
        let button = MDCButton()
        let containerScheme = MDCContainerScheme()
        button.applyTextTheme(withScheme: containerScheme)
        button.setTitle("Forgot Password?", for: .normal)
        button.isUppercaseTitle = false
        button.setTitleColor(UIColor().hexStringToUIColor(hex: "#495057"), for: .normal)
        button.titleLabel!.font = UIFont(name: "HelveticaNeue" , size: 15)
        button.addTarget(self, action: #selector(forgοtButtonTouchUpInsideHandler(_:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc func forgοtButtonTouchUpInsideHandler(_ sender: UIButton) {
        print("Forgot Button pressed")
    }
    
    lazy var usernameTextField: MDCFilledTextField = {
        let textField = MDCFilledTextField()
        let containerScheme = MDCContainerScheme()
        textField.applyTheme(withScheme: containerScheme)
        textField.setFilledBackgroundColor(.clear, for: .normal)
        textField.setFilledBackgroundColor(.clear, for: .editing)
        textField.setUnderlineColor(UIColor().hexStringToUIColor(hex: "#495057"), for: .editing)
        textField.setFloatingLabelColor(UIColor().hexStringToUIColor(hex: "#495057"), for: .editing)
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
          textField.setFilledBackgroundColor(.clear, for: .normal)
          textField.setFilledBackgroundColor(.clear, for: .editing)
          textField.setUnderlineColor(UIColor().hexStringToUIColor(hex: "#495057"), for: .editing)
          textField.setFloatingLabelColor(UIColor().hexStringToUIColor(hex: "#495057"), for: .editing)
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
    
    
    lazy var formStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [usernameTextField,passwordTextField])
         stackView.axis = .vertical
         stackView.spacing = 30.0
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
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return button
    }()
    
    lazy var activityIndicator: MDCActivityIndicator = {
        let activityIndicator = MDCActivityIndicator(frame: .zero)
        activityIndicator.cycleColors = [UIColor().hexStringToUIColor(hex: "#495057")]
        activityIndicator.isHiddenInStackView = true
        return activityIndicator
    }()
    
    lazy var loginButtonStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [loginButton, activityIndicator])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    @objc func loginButtonTouchUpInsideHandler(_ sender: UIButton){
        guard
            let username = usernameTextField.text,
            let password = passwordTextField.text
        else {
            return
        }
        if username.isEmpty {
            usernameTextField.showError(text: "Username required.")
        }
        if password.isEmpty{
            passwordTextField.showError(text: "Password required.")
        }
        guard !username.isEmpty && !password.isEmpty else { return }
        start()
        delegate?.didTappedLoginButton(usernameText: usernameTextField.text!, passwordText: passwordTextField.text!)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .systemRed
        //self.addSubview(tabBarView)
        self.addSubview(formStackView)
        self.addSubview(loginButtonStackView)
        self.addSubview(loginLabel)
        self.addSubview(forgοtPasswordButton)
        loginConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loginConstraint(){
        
        loginLabel.topAnchor.constraint(equalTo: self.topAnchor,constant: 17).isActive = true
        //loginLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -20).isActive = true
        loginLabel.heightAnchor.constraint(equalToConstant: 45).isActive = true
        loginLabel.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        
        formStackView.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 30).isActive = true
        formStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        formStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        
        loginButtonStackView.topAnchor.constraint(equalTo: formStackView.bottomAnchor, constant: 30).isActive = true
        loginButtonStackView.leadingAnchor.constraint(equalTo: formStackView.leadingAnchor).isActive = true
        loginButtonStackView.trailingAnchor.constraint(equalTo: formStackView.trailingAnchor).isActive = true
        
        forgοtPasswordButton.topAnchor.constraint(equalTo: loginButtonStackView.bottomAnchor,constant: 20).isActive = true
        forgοtPasswordButton.leadingAnchor.constraint(equalTo: loginButtonStackView.leadingAnchor).isActive = true
        
        
    }
    
}
extension LoginView: ActivityIndicator {
    
    func start() {
        self.loginButton.isHidden = true
        self.activityIndicator.isHidden = false
        self.activityIndicator.startAnimating()
    }
    
    func stop() {
        loginButton.isHidden = false
        activityIndicator.isHidden = true
        activityIndicator.stopAnimating()
    }
    
}
