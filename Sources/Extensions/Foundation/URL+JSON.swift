//
//  URL+JSON.swift
//  Prego
//
//  Created by Filipe Dias on 30/09/2019.
//

import Foundation

public extension URL {

    func appendingQueryParameters(_ json: JSON) -> URL {
        let URLString : String = String(format: "%@?%@", self.absoluteString, json.queryParameters)
        return URL(string: URLString)!
    }
}

public protocol URLQueryParameterStringConvertible {
    var queryParameters: String {get}
}

extension JSON : URLQueryParameterStringConvertible {

    public var queryParameters: String {
        var parts: [String] = []
        for (key, value) in self {
            let part = String(format: "%@=%@",
                              String(describing: key).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!,
                              String(describing: value).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)
            parts.append(part as String)
        }
        return parts.joined(separator: "&")
    }

}
