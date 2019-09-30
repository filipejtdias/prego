//
//  ResourceLoaderError.swift
//  Pods-Prego_Example
//
//  Created by Filipe Dias on 30/09/2019.
//

import Foundation

public enum ResourceLoaderError: Swift.Error {
    case fileNotFound
    case parseFailed(Error)
    case empty
}
