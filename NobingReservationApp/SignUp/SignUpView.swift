//
//  SignUpView.swift
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
protocol SignUpDelegate: AnyObject {
    func didTapSignUpButton(email:String?,firstPassword:String?,rewritePassword:String?)
}

class SignUpView : UIView {
    var delegate: SignUpDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .systemRed
        self.addSubview(formStackView)
        self.addSubview(signUpButton)
        self.addSubview(signUpLabel)
        signUpConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    var signUpLabel: UILabel = {
        var label = UILabel()
        label.backgroundColor = .clear
        label.sizeToFit()
        label.text = "Sign Up"
        label.textAlignment = .center
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont(name: "HelveticaNeue-UltraLight", size: 40)
        label.setContentHuggingPriority(.defaultHigh, for: .vertical)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var newUsernameTextField: MDCFilledTextField = {
        let textField = MDCFilledTextField()
        let containerScheme = MDCContainerScheme()
        textField.applyTheme(withScheme: containerScheme)
        textField.setFilledBackgroundColor(.clear, for: .normal)
        textField.setFilledBackgroundColor(.clear, for: .editing)
        textField.setUnderlineColor(UIColor().hexStringToUIColor(hex: "#495057"), for: .editing)
        textField.setFloatingLabelColor(UIColor().hexStringToUIColor(hex: "#495057"), for: .editing)
        textField.label.text = "Write your Username"
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
    lazy var emailTextField: MDCFilledTextField = {
        let textField = MDCFilledTextField()
        let containerScheme = MDCContainerScheme()
        textField.applyTheme(withScheme: containerScheme)
        textField.setFilledBackgroundColor(.clear, for: .normal)
        textField.setFilledBackgroundColor(.clear, for: .editing)
        textField.setUnderlineColor(UIColor().hexStringToUIColor(hex: "#495057"), for: .editing)
        textField.setFloatingLabelColor(UIColor().hexStringToUIColor(hex: "#495057"), for: .editing)
        textField.label.text = "Write a valid Email"
        textField.textContentType = .username
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.leftViewMode = .always
        textField.layer.cornerRadius = 20
        textField.leftView = UIImageView(image: #imageLiteral(resourceName: "email_x20").withRenderingMode(.alwaysTemplate))
        textField.leftView?.tintColor = UIColor().hexStringToUIColor(hex: "#495057")
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var passwordTextField: MDCFilledTextField = {
         let textField = MDCFilledTextField()
          let containerScheme = MDCContainerScheme()
          textField.applyTheme(withScheme: containerScheme)
          textField.setFilledBackgroundColor(.clear, for: .normal)
          textField.setFilledBackgroundColor(.clear, for: .editing)
          textField.setUnderlineColor(UIColor().hexStringToUIColor(hex: "#495057"), for: .editing)
          textField.setFloatingLabelColor(UIColor().hexStringToUIColor(hex: "#495057"), for: .editing)
          textField.label.text = "Create a Password"
          textField.textContentType = .newPassword
          textField.isSecureTextEntry = true
          textField.autocorrectionType = .no
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
    
    lazy var repeatPasswordTextField: MDCFilledTextField = {
        let textField = MDCFilledTextField()
        let containerScheme = MDCContainerScheme()
        textField.applyTheme(withScheme: containerScheme)
        textField.setFilledBackgroundColor(.clear, for: .normal)
        textField.setFilledBackgroundColor(.clear, for: .editing)
        textField.setUnderlineColor(UIColor().hexStringToUIColor(hex: "#495057"), for: .editing)
        textField.setFloatingLabelColor(UIColor().hexStringToUIColor(hex: "#495057"), for: .editing)
        textField.label.text = "Confirm password"
        textField.leadingAssistiveLabel.text = "min. 6 characters, one uppercase, one lowercase, one number and one symbol"
        textField.textContentType = .newPassword
        textField.autocorrectionType = .no
        textField.isSecureTextEntry = true
        textField.leftViewMode = .always
        textField.leftView = UIImageView(image: #imageLiteral(resourceName: "lock_x20").withRenderingMode(.alwaysTemplate))
        textField.leftView?.tintColor = UIColor().hexStringToUIColor(hex: "#495057")
        textField.rightViewMode = .always
        textField.trailingView = repeatPasswordShowHideButton
        textField.rightView?.tintColor = UIColor().hexStringToUIColor(hex: "#495057")
        return textField
    }()
    lazy var repeatPasswordShowHideButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 24, height: 24))
        button.setImage(#imageLiteral(resourceName: "onvisibility_x20").withRenderingMode(.alwaysTemplate), for: .normal)
        button.setImage(#imageLiteral(resourceName: "outlinevisibility_x20").withRenderingMode(.alwaysTemplate), for: .selected)
        button.addTarget(self, action: #selector(repeatPasswordShowHideButtonTouchUpInsideHandler(_:)), for: .touchUpInside)
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
    @objc func repeatPasswordShowHideButtonTouchUpInsideHandler(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        
        if sender == repeatPasswordShowHideButton {
            repeatPasswordTextField.isSecureTextEntry = !sender.isSelected
        } else if sender == repeatPasswordShowHideButton {
            repeatPasswordTextField.isSecureTextEntry = !sender.isSelected
        }
    }
    
    
    lazy var formStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [emailTextField,passwordTextField,repeatPasswordTextField])
         stackView.axis = .vertical
         stackView.spacing = 20.0
         stackView.translatesAutoresizingMaskIntoConstraints = false
         return stackView
     }()
    
    lazy var signUpButton: MDCButton = {
        let button = MDCButton()
        let containerScheme = MDCContainerScheme()
        button.applyContainedTheme(withScheme: containerScheme )
        button.setTitle("Sign Up", for: .normal)
        button.layer.cornerRadius = 15
        button.backgroundColor = UIColor().hexStringToUIColor(hex: "#495057")
        button.addTarget(self, action: #selector(signUpButtonTouchUpInsideHandler(_:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc func signUpButtonTouchUpInsideHandler(_ sender: UIButton){
        delegate?.didTapSignUpButton(email: emailTextField.text!, firstPassword: passwordTextField.text!,rewritePassword:repeatPasswordTextField.text!)
    }

    
    func  signUpConstraint(){
      
        signUpLabel.topAnchor.constraint(equalTo: self.topAnchor,constant: 17).isActive = true
        signUpLabel.heightAnchor.constraint(equalToConstant: 45).isActive = true
        signUpLabel.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
 
        formStackView.topAnchor.constraint(equalTo: signUpLabel.bottomAnchor, constant: 30).isActive = true
        formStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        formStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        
        signUpButton.topAnchor.constraint(equalTo: formStackView.bottomAnchor, constant: 30).isActive = true
        signUpButton.leadingAnchor.constraint(equalTo: formStackView.leadingAnchor).isActive = true
        signUpButton.trailingAnchor.constraint(equalTo: formStackView.trailingAnchor).isActive = true
        signUpButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
 
    }
}
