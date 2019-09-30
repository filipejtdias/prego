//
//  Remote.swift
//  Prego
//
//  Created by Filipe Dias on 27/09/2019.
//

import Foundation

public class Remote: HTTPService {

    private var session: HTTPSession
    private var dataTask: URLSessionDataTask?

    public init(session: HTTPSession) {
        self.session = session
    }

    public func get(path: String,
                    parameters: HTTPParameters?,
                    completion: @escaping Handler) {

        request(method: .get,
                path: path,
                parameters: parameters,
                completion: completion)
    }

    private func request(method: HTTPMethod,
                         path: String,
                         parameters: HTTPParameters?,
                         completion: @escaping Handler) {

        guard var url = buildURL(path: path) else {
            completion(.failure(.urlMalformed))
            return
        }

        if let params = parameters, method == .get {
            url = url.appendingQueryParameters(params)
        }

        var request = URLRequest(url: url)
        request.httpMethod = method.description

        performRequest(request: request, completion: completion)
    }

    private func performRequest(request: URLRequest,
                                completion: @escaping Handler) {

        dataTask = session.urlSession.dataTask(with: request) { [weak self] data, response, error in
            guard let self = self else {
                completion(.failure(.other))
                return
            }
            self.handleTask(with: data,
                            urlResponse: response,
                            error: error,
                            completion: completion)
        }
        dataTask?.resume()
    }

    private func handleTask(with data: Data?,
                            urlResponse: URLResponse?,
                            error: Error?,
                            completion: @escaping Handler) {
        let response: HTTPResponse = NetworkResponse(data: data,
                                                     httpResponse: urlResponse,
                                                     error: error)
        handle(response, completion)
    }

    private func handle(_ response: HTTPResponse,
                        _ completion: Handler) {

        if let networkError = response.error {
            completion(.failure(networkError))
        } else if let data = response.data, response.isValid {
            completion(.success(data))
        } else {
            completion(.failure(.other))
        }

    }

    private func buildURL(path: String) -> URL? {

        let url = URL(string: path, relativeTo: session.endpoint)
        return url
    }

}
