//
//  HTTPService.swift
//  Prego
//
//  Created by Filipe Dias on 27/09/2019.
//

import Foundation

public protocol HTTPService {
    
    typealias HTTPParameters = JSON
    typealias DataType = Data
    typealias ErrorType = HTTPError
    typealias ReturnType = Result<DataType, ErrorType>
    typealias Handler = (ReturnType) -> ()

    func get(path: String,
             parameters: HTTPParameters?,
             completion: @escaping Handler)
}
