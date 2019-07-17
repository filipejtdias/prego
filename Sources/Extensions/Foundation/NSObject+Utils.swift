//
//  NSObject+Utils.swift
//  Prego
//
//  Created by Filipe Dias on 04/05/2018.
//

import Foundation

public extension NSObject {
    
    /**
     Retrieves an array of property names found on the current object
     using Objective-C runtime functions for introspection:
     
     @see https://developer.apple.com/library/mac/documentation/Cocoa/Conceptual/ObjCRuntimeGuide/Articles/ocrtPropertyIntrospection.html
     
     @see http://derpturkey.com/get-property-names-of-object-in-swift/
     */
    func propertyNames() -> Array<String> {
        
        var results: Array<String> = [];
        
        // Retrieve the properties via the class_copyPropertyList function
        var count: UInt32 = 0;
        let myClass: AnyClass = self.classForCoder;
        let properties = class_copyPropertyList(myClass, &count);
        
        // Iterate each objc_property_t struct
        for i: UInt32 in 0 ..< count {
            
            let property = properties?[Int(i)];
            
            // retrieve the property name by calling property_getName function
            let cname = property_getName(property!);
            
            // covert the c string into a Swift string
            let name = String(cString: cname);
            results.append(name);
        }
        
        // release objc_property_t structs
        free(properties);
        
        return results;
    }
}
