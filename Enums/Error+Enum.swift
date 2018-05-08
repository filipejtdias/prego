//
//  Error+Enum.swift
//  Prego
//
//  Created by Filipe Dias on 08/05/2018.
//

import Foundation

public enum NetworkError: Swift.Error {
    
    case unknown
    case invalidType
    case parseFailed
    case noResults
    case http(Error)
}
