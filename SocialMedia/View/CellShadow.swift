//
//  CellShadow.swift
//  SocialMedia
//
//  Created by Vy Le on 3/28/18.
//  Copyright © 2018 Vy Le. All rights reserved.
//

import UIKit

class CellShadow: UIView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 3
        layer.shadowOpacity = 0.6
        layer.shadowRadius = 1.5
        layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        layer.shadowColor = UIColor(red: 157/255, green: 157/255, blue: 157/255, alpha: 1.0).cgColor
    }
    
}
