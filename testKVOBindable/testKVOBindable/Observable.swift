//
//  Observable.swift
//  testKVOBindable
//
//  Created by Filipe Dias on 15/04/2021.
//

import Foundation

class Observable<T>: NSObject {
    
    typealias CompletionBlock = (T?) -> Void
    
    private var observation: NSKeyValueObservation?
    
    @Atomic @objc dynamic
    private var _value: AnyObject?
    
    private var value: T? {
        get { _value as? T }
        set { _value = newValue as AnyObject }
    }
    
    var currentValue: T? {
        value
    }
    
    init(initialValue: T? = nil) {
        super.init()
        self.value = initialValue
    }
    
    func update(_ value: T?) {
        self.value = value
    }
    
    func add(_ completion: @escaping CompletionBlock) {
        
        observation = observe(\._value,
                              options: [.new]) { [completion] _, change in
            completion(change.newValue as? T)
        }
        
    }
    
    func addAndNotify(_ completion: @escaping CompletionBlock) {
        
        observation = observe(\._value,
                              options: [.initial, .new]) { [completion] _, change in
            completion(change.newValue as? T)
        }
        
    }
    
}
