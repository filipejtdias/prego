//
//  HTTPMethod.swift
//  Prego
//
//  Created by Filipe Dias on 27/09/2019.
//

import Foundation

enum HTTPMethod: String, CustomStringConvertible {

    case get = "GET"

    var description: String {
        return rawValue
    }
}
