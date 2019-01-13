//
//  Dictionary+Utils.swift
//  Prego
//
//  Created by Filipe Dias on 04/05/2018.
//

import Foundation

public extension Dictionary {
    
    public mutating func merge(with dictionary: [Key: Value]?) {
        
        guard let dictionary = dictionary else { return }
        
        for (k, v) in dictionary {
            
            updateValue(v, forKey: k)
        }
        
    }
}
