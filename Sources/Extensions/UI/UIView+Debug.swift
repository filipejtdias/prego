//
//  UIView+Debug.swift
//  Prego
//
//  Created by Filipe Dias on 04/05/2018.
//

import Foundation
import UIKit

public extension UIView {
    
    public func debugLayer(color: UIColor = .random, width: CGFloat = 1.0) {
        
        layer.borderColor = color.cgColor
        layer.borderWidth = width
    }
}
