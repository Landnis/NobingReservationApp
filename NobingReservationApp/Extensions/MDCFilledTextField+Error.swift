//
//  MDCFilledTextField+Error.swift
//  NobingReservationApp
//
//  Created by Konstantinos Stergiannis on 15/9/22.
//

import Foundation
import MaterialComponents

extension MDCFilledTextField {
    
    func showError(text: String) {
        self.leadingAssistiveLabel.text = text
        let containerScheme = MDCContainerScheme()
        self.applyErrorTheme(withScheme: containerScheme)
        self.setFilledBackgroundColor(.clear, for: .normal)
        self.setFilledBackgroundColor(.clear, for: .editing)
    }
    
    func hideError() {
        self.leadingAssistiveLabel.text = nil
        let containerScheme = MDCContainerScheme()
        self.applyTheme(withScheme: containerScheme)
        self.setFilledBackgroundColor(.clear, for: .normal)
        self.setFilledBackgroundColor(.clear, for: .editing)
    }
}
