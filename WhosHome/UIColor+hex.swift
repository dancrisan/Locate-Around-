//
//  UIColor+hex.swift
//  WhosHome
//
//  Created by Dan Crisan on 2015-11-10.
//  Copyright © 2015 davik. All rights reserved.
//

import UIKit

extension UIColor {
    // Usage: UIColor(hex: 0xFC0ACE)
    convenience init(hex: Int) {
        self.init(hex: hex, alpha: 1)
    }
    
    // Usage: UIColor(hex: 0xFC0ACE, alpha: 0.25)
    convenience init(hex: Int, alpha: Double) {
        self.init(
            red: CGFloat((hex >> 16) & 0xff) / 255,
            green: CGFloat((hex >> 8) & 0xff) / 255,
            blue: CGFloat(hex & 0xff) / 255,
            alpha: CGFloat(alpha))
    }
}
