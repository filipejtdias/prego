//
//  UITableView+Utils.swift
//  Prego
//
//  Created by Filipe Dias on 04/05/2018.
//

import Foundation
import UIKit

public extension UITableView {
    
    public func register<T: UITableViewCell>(_: T.Type) where T: ReusableView, T: NibLoadedView {
        
        let nib = UINib(nibName: T.nibName, bundle: nil)
        register(nib, forCellReuseIdentifier: T.reuseIdentifier)
    }
    
    public func register<T: UITableViewHeaderFooterView>(_: T.Type) where T: ReusableView, T: NibLoadedView {
        
        let nib = UINib(nibName: T.nibName, bundle: nil)
        register(nib, forHeaderFooterViewReuseIdentifier: T.reuseIdentifier)
    }
    
    public func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T where T: ReusableView {
        
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }
        
        return cell
    }
    
    public func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>() -> T where T: ReusableView {
        
        guard let headerFooterView = dequeueReusableHeaderFooterView(withIdentifier: T.reuseIdentifier) as? T else {
            
            fatalError("Could not dequeue HeaderFooterView with identifier: \(T.reuseIdentifier)")
        }
        
        return headerFooterView
    }
    
    public func scrollToTop(animeted: Bool = true) {
        
        scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: true)
    }
}
