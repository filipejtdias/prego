//
//  AppInfo.swift
//  Prego
//
//  Created by Filipe Dias on 04/05/2018.
//

import Foundation

public class AppInfo {
    
    public static var bundle: Bundle = .main
    
    public class func languageBundle(_ language: String, bundle: Bundle) -> Bundle? {
        
        if let path = bundle.path(forResource: language, ofType: "lproj") {
            let languageBundle = Bundle(path: path)
            
            return languageBundle
        }
        
        return nil
    }
    
    public class func version() -> String? {
        
        return bundle.object(forInfoDictionaryKey: "CFBundleShortVersionString")
            as? String
    }
    
    public class func build() -> String? {
        
        return bundle.object(forInfoDictionaryKey: "CFBundleVersion") as? String
    }
    
    public class func formattedVersionBuild() -> String {
        
        let version = self.version() ?? ""
        let build = self.build() ?? ""
        
        return "\(version)(\(build))"
    }
    
    public class func applicationID() -> String {
        
        if let applicationID: String = bundle.object(forInfoDictionaryKey: kCFBundleIdentifierKey as String) as? String {
            
            return applicationID
        }
        
        return ""
    }
    
    public class func productName() -> String {
        
        if let pName: String = bundle.object(forInfoDictionaryKey: kCFBundleNameKey as String) as? String {
            
            return pName
        }
        
        return ""
    }
    
    public class func bundleSeedID() -> String {
        
        if let bundleSeedId = bundle.object(forInfoDictionaryKey: "AppIdentifierPrefix") as? String {
            
            return bundleSeedId
        }
        
        return ""
    }
}
