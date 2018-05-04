//
//  Platform.swift
//  Prego
//
//  Created by Filipe Dias on 04/05/2018.
//

import Foundation

public struct Platform {
    
    public static let isSimulator: Bool = {
        
        var simulator = false
        
        #if arch(i386) || arch(x86_64)
        simulator = true
        #endif
        
        return simulator
    }()
}
