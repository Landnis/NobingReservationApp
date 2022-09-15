//
//  ContactUsView.swift
//  NobingReservationApp
//
//  Created by Konstantinos Stergiannis on 14/9/22.
//

import UIKit
import WebKit
import MaterialComponents.MaterialTextControls_FilledTextFields
import MaterialComponents.MaterialTextControls_FilledTextFieldsTheming
import MaterialComponents.MaterialTextControls_OutlinedTextFields
import MaterialComponents.MaterialTextControls_OutlinedTextAreas
import MaterialComponents.MaterialButtons
import MaterialComponents.MaterialButtons_Theming
class ContactUsView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .systemRed
        addSubview(contactUsLabel)
        addSubview(formStackView)
        addSubview(buttonStackView)
        addSubviewsConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    var contactUsLabel: UILabel = {
        var label = UILabel()
        label.backgroundColor = .clear
        label.sizeToFit()
        label.text = "Contact Us"
        label.textAlignment = .center
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont(name: "HelveticaNeue-ThinItalic", size: 40)
        label.setContentHuggingPriority(.defaultHigh, for: .vertical)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var usernameTextField: MDCFilledTextField = {
        let textField = MDCFilledTextField()
        let containerScheme = MDCContainerScheme()
        textField.applyTheme(withScheme: containerScheme)
        textField.setFilledBackgroundColor(.clear, for: .normal)
        textField.setFilledBackgroundColor(.clear, for: .editing)
        textField.setUnderlineColor(UIColor().hexStringToUIColor(hex: "#495057"), for: .editing)
        textField.setFloatingLabelColor(UIColor().hexStringToUIColor(hex: "#495057"), for: .editing)
        textField.label.text = "Username"
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
        textField.label.text = "Email"
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
    
    lazy var subjectTextField: MDCFilledTextField = {
        let textField = MDCFilledTextField()
        let containerScheme = MDCContainerScheme()
        textField.applyTheme(withScheme: containerScheme)
        textField.setFilledBackgroundColor(.clear, for: .normal)
        textField.setFilledBackgroundColor(.clear, for: .editing)
        textField.setUnderlineColor(UIColor().hexStringToUIColor(hex: "#495057"), for: .editing)
        textField.setFloatingLabelColor(UIColor().hexStringToUIColor(hex: "#495057"), for: .editing)
        textField.label.text = "Subject"
        return textField
    }()
    
    lazy var textView: UITextView = {
        let textView = UITextView()
        textView.contentInsetAdjustmentBehavior = .automatic
        textView.center = self.center
        textView.textAlignment = NSTextAlignment.justified
        textView.backgroundColor = .lightGray
        textView.font = UIFont(name: "Verdana", size: 17)
        textView.delegate = self
        textView.autocapitalizationType = UITextAutocapitalizationType.allCharacters
        textView.isScrollEnabled = true
        textView.isSelectable = true
        textView.isEditable = true
        textView.autocorrectionType = UITextAutocorrectionType.yes
        textView.spellCheckingType = UITextSpellCheckingType.yes
        textView.heightAnchor.constraint(equalToConstant: 180).isActive = true
        textView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMaxYCorner]
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    lazy var activityIndicator: MDCActivityIndicator = {
        let activityIndicator = MDCActivityIndicator(frame: .zero)
        activityIndicator.cycleColors = [UIColor().hexStringToUIColor(hex: "#495057")]
        activityIndicator.isHidden = true
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        return activityIndicator
    }()
    
    lazy var contactButton: MDCButton = {
        let button = MDCButton()
        let containerScheme = MDCContainerScheme()
        button.applyContainedTheme(withScheme: containerScheme )
        button.setTitle("Send", for: .normal)
        button.layer.cornerRadius = 15
        button.backgroundColor = UIColor().hexStringToUIColor(hex: "#495057")
        button.addTarget(self, action: #selector(contactButtonTouchUpInsideHandler(_:)), for: .touchUpInside)
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc func contactButtonTouchUpInsideHandler(_ sender: UIButton){
        print("Send!!")
        start()
        DispatchQueue.main.asyncAfter(deadline: .now()+3) {
            self.stop()
        }
    }
    lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [contactButton, activityIndicator])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var formStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [usernameTextField, emailTextField, subjectTextField, textView])
        stackView.axis = .vertical
        stackView.spacing = 15.0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    
    func addSubviewsConstraints(){
       contactUsLabel.topAnchor.constraint(equalTo: topAnchor,constant: 17).isActive = true
       contactUsLabel.heightAnchor.constraint(equalToConstant: 45).isActive = true
       contactUsLabel.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        
        formStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        formStackView.topAnchor.constraint(equalTo: contactUsLabel.bottomAnchor).isActive = true
        formStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        
        buttonStackView.topAnchor.constraint(equalTo: formStackView.bottomAnchor,constant: 5).isActive = true
        buttonStackView.leadingAnchor.constraint(equalTo: formStackView.leadingAnchor).isActive = true
        buttonStackView.trailingAnchor.constraint(equalTo: formStackView.trailingAnchor).isActive = true
    }
    

}

extension ContactUsView: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView){
        if textView.textColor == UIColor.lightGray {
                textView.text = nil
                textView.textColor = UIColor.black
            }
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Message"
            textView.textColor = UIColor.lightGray
        }
    }
}
extension ContactUsView: ActivityIndicator {
    
    func start() {
       contactButton.isHidden = true
       activityIndicator.isHidden = false
       activityIndicator.startAnimating()
    }
    
    func stop() {
        contactButton.isHidden = false
        activityIndicator.isHidden = true
        activityIndicator.stopAnimating()
    }
    
}
