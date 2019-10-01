//
//  POperationQueue.swift
//  Prego
//
//  Created by Filipe Dias on 04/05/2018.
//

import Foundation

public typealias POperationQueueCompletionBlock = () -> (()?)

public class POperationQueue: OperationQueue {
    
    public var isRunning: Bool = false
    public var completionBlock: POperationQueueCompletionBlock? = nil
    
    override public func cancelAllOperations() {
        
        isRunning = false
        
        super.cancelAllOperations()
    }
    
    override public func observeValue(
        forKeyPath keyPath: String?,
        of object: Any?,
        change: [NSKeyValueChangeKey : Any]?,
        context: UnsafeMutableRawPointer?) {
        
        // 1. Check queue
        guard let queue = object as? OperationQueue, queue == self else {
            return
        }
        
        // 2. Check if it's the operationCount observer
        guard let operationCountKey = keyPath, operationCountKey == "operationCount" else {
            return
        }
        
        // 3. Only perform completionBlock when operationCount goes from 1 to 0
        if let oldValue = change?[NSKeyValueChangeKey.oldKey] as? Int,
               oldValue == 1 && queue.operationCount == 0 {
            
            DispatchQueue.main.async(execute: { [weak self] in
                
                guard let self = self else { return }
                
                self.isRunning = false
                self.removeObserver(self, forKeyPath: "operationCount")
                self.completionBlock?()
                
                self.completionBlock = nil // will prevent memory leak
            })
        }
    }
    
    public func setCompletionBlock(options op: NSKeyValueObservingOptions,
                                   completion: @escaping POperationQueueCompletionBlock) {
        
        if operations.count > 0 {
            
            isRunning = true
            addObserver(self, forKeyPath: "operationCount", options: op, context: nil)
            completionBlock = completion
            
        } else {
            
            print("Trying to add an observer without anyone to watch! / Trying to start an operation without adding it to a queue!")
        }
    }
    
    deinit {
        
        // No need to remove observer because it's already done on `observeValueForKeyPath` method
        print("POperationQueue deinit...")
    }
}
