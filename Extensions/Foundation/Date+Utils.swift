//
//  Date+Utils.swift
//  Prego
//
//  Created by Filipe Dias on 04/05/2018.
//

import Foundation

public extension Date {
    
    public init?(dotNetJSONString: String) {
        
        guard !dotNetJSONString.isEmpty &&
            dotNetJSONString.hasPrefix("/Date(") &&
            dotNetJSONString.hasSuffix(")/") else { return nil }
        
        do {
            
            let dateRegEx = try NSRegularExpression(pattern: "^\\/date\\((-?\\d++)(?:([+-])(\\d{2})(\\d{2}))?\\)\\/$", options: .caseInsensitive)
            
            if let regexResult = dateRegEx.firstMatch(in: dotNetJSONString,
                                                      options: .reportProgress,
                                                      range: NSMakeRange(0,dotNetJSONString.count)),
                let jsonString: NSString = dotNetJSONString as NSString?,
                let num = Double(jsonString.substring(with: regexResult.range(at: 1)))
            {
                
                var seconds: TimeInterval = num / 1000.0
                
                // timezone offset
                if regexResult.range(at: 2).location != NSNotFound {
                    
                    let sign = jsonString.substring(with: regexResult.range(at: 2))
                    
                    if let hours = Double(jsonString.substring(with: regexResult.range(at: 3))),
                        let hour = Double(sign + String(hours * 60.0 * 60.0)) {
                        
                        seconds += hour
                    }
                    
                    if let minutes = Double(jsonString.substring(with: regexResult.range(at: 4))),
                        let minute = Double(sign + String(minutes * 60.0)) {
                        
                        seconds += minute
                    }
                }
                
                self.init(timeIntervalSince1970: seconds)
                return
            }
            
        } catch {
            
            return nil
        }
        
        return nil
    }
}
