//
//  Bindable.swift
//  Prego
//
//  Created by Filipe Dias on 27/09/2019.
//

import Foundation

@propertyWrapper
public class Bindable<T> {
    
    public var projectedValue: Bindable { self }
    
    public var wrappedValue: T {
        
        get {
            guard let value = value else { fatalError("A value must be set first") }
            return value
        }
        
        set {
            value = newValue
            notify()
        }
    }

    public typealias Listener = (T) -> ()

    private var listener: Listener?
    private var value: T?

    public init(_ v: T? = nil) {
        value = v
    }

    public func bind(_ listener: Listener?) {
        self.listener = listener
    }

    public func bindAndFire(_ listener: Listener?) {
        self.listener = listener
        notify()
    }
    
    private func notify() {
        guard let value = value else { return }
        listener?(value)
    }

}
