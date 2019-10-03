//
//  NetworkResponse.swift
//  Prego
//
//  Created by Filipe Dias on 27/09/2019.
//

import Foundation

public class NetworkResponse: HTTPResponse {

    public private(set) var data: Data?
    public private(set) var httpResponse: URLResponse?
    public private(set) var error: HTTPError?

    public init(data: Data?, httpResponse: URLResponse?, error: Error?) {
        self.data = data
        self.httpResponse = httpResponse
        self.error = build(with: error)
    }

    private func build(with error: Error?) -> HTTPError? {
        if let err = error {
            return .http(err)
        }
        if let response = httpResponse as? HTTPURLResponse, !isValid {
            return .status(response.statusCode)
        }
        return nil
    }

}
