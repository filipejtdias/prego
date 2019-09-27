//
//  UIViewController+Storyboard.swift
//  Prego
//
//  Created by Filipe Dias on 27/09/2019.
//

import Foundation
import UIKit

/*
 USAGE

enum Storyboard: String {
    case storyboardName = "MyStoryboard"
}

extension Storyboard: CustomStringConvertible {

    var description: String {
        return self.rawValue
    }

}

 let storyboard: Storyboard = .storyboardName
 let vc = SomeViewController.viewController(for: storyboard)
*/

public protocol Storyboardable: class {
    static var storyboardID: String { get }
}

extension Storyboardable where Self: UIViewController {

    public static var storyboardID: String {
        return String(describing: self)
    }

    public static func viewController(for storyboard: String) -> Self {
        let storyboard = UIStoryboard(name: storyboard, bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: storyboardID) as? Self else {
            fatalError("Could not instantiate initial storyboard with name: \(storyboardID)")
        }

        return vc
    }
}

extension UIViewController: Storyboardable { }
