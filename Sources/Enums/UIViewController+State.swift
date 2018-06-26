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

public typealias ViewControllerStateChanged<T, E> = (ViewControllerState<T, E>) -> Void
