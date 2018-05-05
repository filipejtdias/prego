//
//  POperation.swift
//  Prego
//
//  Created by Filipe Dias on 04/05/2018.
//

import Foundation

class POperation: Operation {
    
    var success: Bool = false
    var error: Error?
    
    override init() {
        
        _executing = false
        _finished = false
        _asynchronous = true
        _cancelled = false
        
        super.init()
    }
    
    // MARK: - Convinience operation finished
    
    func finishOperation() {
        
        isExecuting = false
        isFinished = true
    }
    
    // MARK: - NSOperation custom execution control (adding dispatch group interaction)
    
    override func start() {
        
        isExecuting = true
        isFinished = false
        
        if isCancelled {
            
            print("\(self) not started because previously canceled")
            return
        }
    }
    
    override func cancel() {
        
        super.cancel()
        
        success = false
        
        isCancelled = true
        isExecuting = false
        isFinished = true
    }
    
    fileprivate var _executing : Bool
    override var isExecuting : Bool {
        
        get {
            
            return _executing
        }
        
        set {
            
            willChangeValue(forKey: "isExecuting")
            _executing = newValue
            didChangeValue(forKey: "isExecuting")
        }
    }
    
    fileprivate var _finished : Bool
    override var isFinished : Bool {
        
        get {
            
            return _finished
        }
        
        set {
            
            willChangeValue(forKey: "isFinished")
            _finished = newValue
            didChangeValue(forKey: "isFinished")
        }
    }
    
    fileprivate var _asynchronous : Bool
    override var isAsynchronous : Bool {
        
        get {
            
            return _asynchronous
        }
        
        set {
            
            willChangeValue(forKey: "isAsynchronous")
            _asynchronous = newValue
            didChangeValue(forKey: "isAsynchronous")
        }
    }
    
    fileprivate var _cancelled : Bool
    override var isCancelled : Bool {
        
        get {
            
            return _cancelled
        }
        
        set {
            
            willChangeValue(forKey: "isCancelled")
            _cancelled = newValue
            didChangeValue(forKey: "isCancelled")
        }
    }
}
