//
//  Bindable.swift
//  Prego
//
//  Created by Filipe Dias on 27/09/2019.
//

import Foundation

public class Bindable<T> {

    public typealias Listener = (T) -> ()

    private var listener: Listener?

    public var value: T {
        didSet {
            listener?(value)
        }
    }

    public init(_ v: T) {
        value = v
    }

    public func bind(_ listener: Listener?) {
        self.listener = listener
    }

    public func bindAndFire(_ listener: Listener?) {
        self.listener = listener
        listener?(value)
    }

}
