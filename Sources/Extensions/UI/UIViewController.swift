//
//  UIViewController.swift
//  Prego
//
//  Created by Filipe Dias on 04/05/2018.
//

import Foundation
import UIKit

public protocol SegueHandlerType {
    
    associatedtype SegueIdentifier: RawRepresentable
}

public extension SegueHandlerType where Self: UIViewController, SegueIdentifier.RawValue == String {
    
    public func performSegue(withIdentifier identifier: SegueIdentifier, sender: Any?) {
        
        performSegue(withIdentifier: identifier.rawValue, sender: sender)
    }
    
    public func segueIdentifier(forSegue segue: UIStoryboardSegue) -> SegueIdentifier {
        
        guard let identifier = segue.identifier,
            let segueIdentifier = SegueIdentifier(rawValue: identifier) else {
                
                fatalError("Invalid segue identifier: \(String(describing: segue.identifier))")
        }
        
        return segueIdentifier
    }
}
