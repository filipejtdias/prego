//
//  NetworkResponse.swift
//  Prego
//
//  Created by Filipe Dias on 27/09/2019.
//

import Foundation

class NetworkResponse: HTTPResponse {

    private(set) var data: Data?
    private(set) var httpResponse: URLResponse?
    private(set) var error: HTTPError?

    init(data: Data?, httpResponse: URLResponse?, error: Error?) {
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
