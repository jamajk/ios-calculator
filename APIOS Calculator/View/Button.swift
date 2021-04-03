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
        layer.cornerRadius = frame.height / 2
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowRadius = 10
        layer.shadowOpacity = 0.35
        layer.shadowOffset = .zero
    }
    
    override open var isHighlighted: Bool {
        didSet {
            layer.opacity = isHighlighted ? 0.5 : 1
        }
    }
}


