//
//  UIView+Utils.swift
//  Prego
//
//  Created by Filipe Dias on 04/05/2018.
//

import Foundation
import UIKit

public extension UIView {
    
    public var halfWidth: CGFloat {
        
        return frame.width / 2.0
    }
    
    public var halfHeight: CGFloat {
        
        return frame.height / 2.0
    }
    
    public var screenshot: UIImage? {
        
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
    public func rotate(angle: CGFloat) {
        
        let radians     = angle / 180.0 * .pi
        let rotation    = CGAffineTransform(rotationAngle: radians)
        transform       = rotation
    }
    
}
