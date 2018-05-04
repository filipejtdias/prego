//
//  Log.swift
//  Prego
//
//  Created by Filipe Dias on 04/05/2018.
//

import Foundation

public class Log {
    
    open static var permissions: LogPermissions = .All
    
    public class func temporary(_ message: String, file: String = #file, function: String = #function, line: Int = #line) {
        
        if (permissions.contains(.Temporary)) {
            
            prettyPrint("🔥 -", message: message, file: file, function: function, line: line)
        }
    }
    
    public class func verbose(_ message: String, file: String = #file, function: String = #function, line: Int = #line) {
        
        if (permissions.contains(.Verbose)) {
            
            prettyPrint("📖 (Verbose)-", message: message, file: file, function: function, line: line)
        }
    }
    
    public class func debug(_ message: String, file: String = #file, function: String = #function, line: Int = #line) {
        
        if (permissions.contains(.Debug)) {
            
            prettyPrint("🔍 (Debug)-", message: message, file: file, function: function, line: line)
        }
    }
    
    public class func warning(_ message: String, file: String = #file, function: String = #function, line: Int = #line) {
        
        if (permissions.contains(.Warning)) {
            
            prettyPrint("⚠️ (Warning)-", message: message, file: file, function: function, line: line)
        }
    }
    
    public class func error(_ message: String, file: String = #file, function: String = #function, line: Int = #line) {
        
        if (permissions.contains(.Error)) {
            
            prettyPrint("❌ (Error)-", message: message, file: file, function: function, line: line)
        }
    }
    
    public class func network(_ message: String, file: String = #file, function: String = #function, line: Int = #line) {
        
        if (permissions.contains(.Network)) {
            
            prettyPrint("🌐 (Network)-", message: message, file: file, function: function, line: line)
        }
    }
    
    public class func persistence(_ message: String, file: String = #file, function: String = #function, line:Int = #line) {
        
        if (permissions.contains(.Persistence)) {
            
            prettyPrint("💾 (Persistence)-", message: message, file: file, function: function, line: line)
        }
    }
    
    public class func analytics(_ message: String, file: String = #file, function: String = #function, line: Int = #line) {
        
        if (permissions.contains(.Analytics)) {
            
            prettyPrint("📊 (Analytics)-", message: message, file: file, function: function, line: line)
        }
    }
    
    private class func prettyPrint(_ prefix: String, message: String, file: String, function: String, line: Int) {
        
        let className = ((file as NSString).lastPathComponent as NSString).deletingPathExtension
        let stringToPrint = "\(prefix)\(className).\(function)[\(line)]: \(message)"
        
        print(stringToPrint)
    }
}
