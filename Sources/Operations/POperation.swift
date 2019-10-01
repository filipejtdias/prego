//
//  POperation.swift
//  Prego
//
//  Created by Filipe Dias on 04/05/2018.
//

import Foundation

public class POperation: Operation {
    
    public var success: Bool = false
    public var error: Error?
    
    override public init() {
        
        _executing = false
        _finished = false
        _asynchronous = true
        _cancelled = false
        
        super.init()
    }
    
    // MARK: - Convinience operation finished
    
    public func finishOperation() {
        
        isExecuting = false
        isFinished = true
    }
    
    // MARK: - NSOperation custom execution control (adding dispatch group interaction)
    
    override public func start() {
        
        isExecuting = true
        isFinished = false
        
        if isCancelled {
            print("\(self) not started because previously canceled")
            return
        }
    }
    
    override public func cancel() {
        
        super.cancel()
        
        success = false
        
        isCancelled = true
        isExecuting = false
        isFinished = true
    }
    
    fileprivate var _executing : Bool
    override public var isExecuting : Bool {
        
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
    override public var isFinished : Bool {
        
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
    override public var isAsynchronous : Bool {
        
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
    override public var isCancelled : Bool {
        
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
