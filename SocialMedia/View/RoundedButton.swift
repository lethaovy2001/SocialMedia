//
//  RoundedButton.swift
//  SocialMedia
//
//  Created by Vy Le on 3/25/18.
//  Copyright © 2018 Vy Le. All rights reserved.
//

import UIKit

class RoundedButton: UIButton {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = self.frame.height / 2
        layer.borderWidth = 2.0
        layer.borderColor = UIColor(red:1.00, green:0.43, blue:0.00, alpha: 0.5).cgColor
    
    }
    
}
