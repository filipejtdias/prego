//
//  UIView+Utils.swift
//  Prego
//
//  Created by Filipe Dias on 04/05/2018.
//

import Foundation
import UIKit

public extension UIView {
    
    var halfWidth: CGFloat {
        
        return frame.width / 2.0
    }
    
    var halfHeight: CGFloat {
        
        return frame.height / 2.0
    }
    
    var screenshot: UIImage? {
        
        UIGraphicsBeginImageContextWithOptions(bounds.size, false, 0.0)
        
        if let tableView = self as? UITableView,
            let sView = tableView.superview,
            let context = UIGraphicsGetCurrentContext() {
            
            sView.layer.render(in: context)
            
        } else if let context = UIGraphicsGetCurrentContext() {
            
            layer.render(in: context)
        }
        
        if let image = UIGraphicsGetImageFromCurrentImageContext() {
            
            UIGraphicsEndImageContext()
            
            return image
        }
        
        return nil
    }
    
    /**
     Rotate a view by specified degrees
     
     - parameter angle: angle in degrees
     */
    func rotate(angle: CGFloat) {
        
        let radians     = angle / 180.0 * .pi
        let rotation    = CGAffineTransform(rotationAngle: radians)
        transform       = rotation
    }

    func applyRoundedCorners(radius: CGFloat = 6.0,
                             width: CGFloat = 1.0,
                             color: UIColor) {
        layer.cornerRadius  = radius
        layer.masksToBounds = true
        layer.borderWidth   = width
        layer.borderColor   = color.cgColor
    }

    func applyShadow(color: UIColor = UIColor.black,
                     offset: CGSize = CGSize(width: 0, height: 4),
                     radius: CGFloat = 7.0,
                     opacity: Float = 0.15) {
        layer.shadowColor   = color.cgColor
        layer.shadowOffset  = offset
        layer.shadowRadius  = radius
        layer.shadowOpacity = opacity
        layer.masksToBounds = false
    }
    
}
