//
//  UIView+HiddenInStackView.swift
//  NobingReservationApp
//
//  Created by Konstantinos Stergiannis on 15/9/22.
//

import Foundation
import UIKit

extension UIView {

    var isHiddenInStackView: Bool {
        get {
            return isHidden
        }
        set {
            if isHidden != newValue {
                isHidden = newValue
            }
        }
    }
}
