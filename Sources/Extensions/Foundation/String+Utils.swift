//
//  String+Utils.swift
//  Prego
//
//  Created by Filipe Dias on 04/05/2018.
//

public extension String {
    
    /**
     Remove whitespaces
     
     - returns:
     String trimmed
     */
    func trim() -> String {
        
        return self.trimmingCharacters(in: .whitespaces)
    }
}

@discardableResult
public func +=(lhs: String, rhs: String) -> String {
    
    return "\(lhs)\(rhs)"
}
