//
//  ImageCircle.swift
//  SocialMedia
//
//  Created by Vy Le on 3/27/18.
//  Copyright © 2018 Vy Le. All rights reserved.
//

import UIKit

class ImageCircle: UIImageView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = self.frame.height / 2
        layer.borderWidth = 1.0
        layer.borderColor = UIColor(red:1.00, green:0.57, blue:0.00, alpha:1.0).cgColor
        
    }
    

    
}
