//
//  Array+Utils.swift
//  Prego
//
//  Created by Filipe Dias on 04/05/2018.
//

import Foundation

public extension Array where Element: Equatable {
    
    public func areAllElementsEqual() -> Bool {
        
        if let firstElem = first {
            
            return !dropFirst().contains { $0 != firstElem }
        }
        
        return true
    }
    
    public func removeDuplicates() -> [Element] {
        
        var result = [Element]()
        
        for value in self {
            
            if result.contains(value) == false {
                
                result.append(value)
            }
        }
        
        return result
    }
    
    public mutating func remove(_ object: Element) -> Bool {
        
        if let pos = index(of: object) {
            
            self.remove(at: pos)
            return true
        }
        
        return false
    }
}
