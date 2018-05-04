//
//  UICollectionView+Utils.swift
//  Prego
//
//  Created by Filipe Dias on 04/05/2018.
//

import UIKit

public extension UICollectionView {
    
    public func register<T: UICollectionViewCell>(_: T.Type) where T: ReusableView {
        
        register(T.self, forCellWithReuseIdentifier: T.reuseIdentifier)
    }
    
    public func register<T: UICollectionViewCell>(_: T.Type) where T: ReusableView, T: NibLoadedView {
        
        let bundle  = Bundle(for: T.self)
        let nib     = UINib(nibName: T.nibName, bundle: bundle)
        
        register(nib, forCellWithReuseIdentifier: T.reuseIdentifier)
    }
    
    public func dequeueReusableCell<T: UICollectionViewCell>(for indexPath: IndexPath) -> T where T: ReusableView {
        
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            
            fatalError("Couln't dequeue cell with identifier: \(T.reuseIdentifier)")
        }
        
        return cell
    }
}
