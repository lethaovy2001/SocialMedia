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
//        layer.shadowOpacity = 1
//        layer.shadowRadius = 5
//        layer.shadowOffset = CGSize(width: 0.0, height: 5)
//        layer.shadowColor = UIColor(red: 157/255, green: 157/255, blue: 157/255, alpha: 1.0).cgColor
        //layer.masksToBounds = true
        
    }
    
    override func layoutSublayers(of layer: CALayer) {
        layer.cornerRadius = self.frame.height / 2
    }
    

    
}
