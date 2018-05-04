//
//  LogPermissions.swift
//  Prego
//
//  Created by Filipe Dias on 04/05/2018.
//

import Foundation

public struct LogPermissions : OptionSet {
    
    public var rawValue: UInt
    
    public init(rawValue: UInt) {
        
        self.rawValue = rawValue
    }
    
    /**
     Use for app flow. Must be easily discarded
    */
    public static let Verbose = LogPermissions(rawValue: 1 << 0)
    
    /**
     Use for app flow. Must have relevant information
    */
    public static let Debug = LogPermissions(rawValue: 1 << 1)
    
    /**
     Use for describing an unexpected event but the app can continue without problems
     */
    public static let Warning = LogPermissions(rawValue: 1 << 2)
    
    /**
     Use when an error occurs
     */
    public static let Error = LogPermissions(rawValue: 1 << 3)
    
    /**
     Use for describing a newtwork call (send or/and receive)
     */
    public static let Network = LogPermissions(rawValue: 1 << 4)
    
    /**
     Use for persistence purposes like Database or NSUserDefaults
     */
    public static let Persistence = LogPermissions(rawValue: 1 << 5)
    
    /**
     Use for sending relevant analytics data or setting important state
     */
    public static let Analytics = LogPermissions(rawValue: 1 << 6)
    
    /**
     Use only for you for debugging purposes. Do not push to git Temporay Logs
     */
    public static let Temporary = LogPermissions(rawValue: 1 << 7)
}

public extension LogPermissions {
    
    /**
     No logs will be printed! Should be used in production builds
     */
    public static let None: LogPermissions = []
    
    /**
     Contains: **Debug**, **Warning**, **Error**, **Network** and **Persistence** logs
     */
    public static let Testing: LogPermissions = [Debug, Warning, Error, Network, Persistence]
    
    /**
     Contains: **Debug**, **Warning**, **Error**, **Network**, **Persistence**, **Analytics** and **Temporary** logs
     */
    public static let Developer: LogPermissions = [Debug, Warning, Error, Network, Persistence, Analytics, Temporary]
    
    /**
     Contains all logs: **Verbose**, **Debug**, **Warning**, **Error**, **Network**, **Persistence**, **Analytics** and **Temporary**
     */
    public static let All: LogPermissions = [Verbose, Debug, Warning, Error, Network, Persistence, Analytics, Temporary]
}
