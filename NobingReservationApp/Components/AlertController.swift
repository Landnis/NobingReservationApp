//
//  AlertComponent.swift
//  NobingReservationApp
//
//  Created by Konstantinos Stergiannis on 1/8/22.
//

import Foundation
import UIKit
import MaterialComponents.MaterialButtons
protocol AlertController {
    
    func presentAlert(title: String, message: String)

}

extension AlertController where Self: UIViewController {
    
    func presentAlert(title: String, message: String) {
        let action = MDCAlertAction(title: "OK", handler: nil)
        let alertController = MDCAlertController(title: title, message: message)
        alertController.addAction(action)
        present(alertController, animated: true, completion: nil)
    }
    
    func logouttAlert(title: String, message: String) {
        let action1 = MDCAlertAction(title: "Logout", handler: nil)
        let action2 = MDCAlertAction(title: "Cancel", handler: nil)
        let alertController = MDCAlertController(title: title, message: message)
        alertController.addAction(action1)
        alertController.addAction(action2)
        present(alertController, animated: true, completion: nil)
    }
    
    func presentAlert(title: String, message: String, actions: MDCAlertAction...) {
        let alertController = MDCAlertController(title: title, message: message)
        
        for action in actions {
            alertController.addAction(action)
        }
        
        present(alertController, animated: true, completion: nil)
    }
    
}

