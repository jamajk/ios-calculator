//
//  Button.swift
//  APIOS Calculator
//
//  Created by Jakub Majkowski on 01/04/2021.
//

import UIKit

class Button: UIButton {

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.layer.cornerRadius = self.frame.height / 2
    }
}
