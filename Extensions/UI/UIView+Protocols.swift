//
//  UIView+Protocols.swift
//  Prego
//
//  Created by Filipe Dias on 04/05/2018.
//

import Foundation
import UIKit

public protocol ReusableView: class {
    
    static var reuseIdentifier: String { get }
}

public extension ReusableView where Self: UIView {
    
    static var reuseIdentifier: String {
        
        return String(describing: self)
    }
}

public protocol NibLoadedView: class {
    
    static var nibName: String { get }
}

public extension NibLoadedView where Self: UIView {
    
    static var nibName: String {
        
        return String(describing: self)
    }
}
