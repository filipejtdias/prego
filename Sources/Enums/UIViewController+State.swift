//
//  UIViewController+State.swift
//  Prego
//
//  Created by Filipe Dias on 13/05/2018.
//

import Foundation

public enum ViewControllerState<T, E> {
    
    case loading
    case loaded(T)
    case error(E)
    case empty(E)
}

extension ViewControllerState: CustomStringConvertible {
    
    public var description: String {
        
        switch self {
            
        case .empty:   return "Empty"
        case .error:   return "Error"
        case .loaded:  return "Loaded"
        case .loading: return "Loading"
            
        }
    }
}

public typealias ViewControllerStateChanged<T, E> = (ViewControllerState<T, E>) -> Void

