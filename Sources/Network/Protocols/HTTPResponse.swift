//
//  HTTPResponse.swift
//  Prego
//
//  Created by Filipe Dias on 27/09/2019.
//

import Foundation

public enum HTTPError: Swift.Error {

    case urlMalformed
    case http(Error)
    case other
    case status(Int)
}

protocol HTTPResponse {
    
    var data: Data? { get }
    var httpResponse: URLResponse? { get }
    var error: HTTPError? { get }
    var hasError: Bool { get }
    var isValid: Bool { get }
}

extension HTTPResponse {

    var hasError: Bool {
        return error != nil
    }

    var isValid: Bool {
        guard let response = httpResponse as? HTTPURLResponse else { return false }
        guard response.statusCode >= 200 && response.statusCode < 300 else { return false }
        return true
    }

}
