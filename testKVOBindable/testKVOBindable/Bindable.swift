//
//  Bindable.swift
//  testKVOBindable
//
//  Created by Filipe Dias on 15/04/2021.
//

import Foundation

@propertyWrapper
struct Bindable<T> {
    
    typealias CompletionBlock = (T?) -> Void
    
    private var observable: Observable<T>
    
    var wrappedValue: T? {
        get { observable.currentValue }
        set { observable.update(newValue)}
    }
    
    var projectedValue: Bindable<T> {
        self
    }
    
    init(_ initialValue: T?) {
        observable = Observable(initialValue: initialValue)
    }
    
    func add(queue: DispatchQueue = .main,
             _ completion: @escaping CompletionBlock) {
        
        observable.add { [completion] newValue in
            queue.async {
                completion(newValue)
            }
        }
    }
    
    func addAndNotify(queue: DispatchQueue = .main,
                      _ completion: @escaping CompletionBlock) {
        
        observable.addAndNotify { [completion] initialOrNewValue in
            queue.async {
                completion(initialOrNewValue)
            }
        }
    }
}
