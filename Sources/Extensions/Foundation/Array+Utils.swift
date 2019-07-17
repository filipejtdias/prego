//
//  Array+Utils.swift
//  Prego
//
//  Created by Filipe Dias on 04/05/2018.
//

import Foundation

public extension Array where Element: Equatable {
    
    func areAllElementsEqual() -> Bool {
        
        if let firstElem = first {
            
            return !dropFirst().contains { $0 != firstElem }
        }
        
        return true
    }
    
    func removeDuplicates() -> [Element] {
        
        var result = [Element]()
        
        for value in self {
            
            if result.contains(value) == false {
                
                result.append(value)
            }
        }
        
        return result
    }
    
    mutating func remove(_ object: Element) -> Bool {
        
      if let pos = firstIndex(of: object) {
            
            self.remove(at: pos)
            return true
        }
        
        return false
    }
}
