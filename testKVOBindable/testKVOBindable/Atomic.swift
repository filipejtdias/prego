//
//  Atomic.swift
//  testKVOBindable
//
//  Created by Filipe Dias on 15/04/2021.
//

import Foundation

@propertyWrapper
class Atomic<T> {
    
    typealias Mutation = (inout T) -> Void
    
    private let queue: DispatchQueue
    private var value: T

    init(queueLabel: String = UUID().uuidString,
         wrappedValue: T) {
        self.queue = DispatchQueue(label: queueLabel,
                                   qos: .background,
                                   attributes: .concurrent)
        self.value = wrappedValue
    }
    
    var wrappedValue: T {
        get {
            return queue.sync { [weak self] in
                guard let self = self else { fatalError() }
                return self.value
            }
        }
        set {
            queue.async(flags: .barrier) { [weak self] in
                guard let self = self else { return }
                self.value = newValue
            }
        }
    }
    
    var projectedValue: Atomic<T> {
        return self
    }
    
    func mutate(_ mutation: @escaping Mutation) {
        return queue.async(flags: .barrier) { [weak self] in
            guard let self = self else { return }
            mutation(&self.value)
        }
    }
}
