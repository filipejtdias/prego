//
//  ResourceLoader.swift
//  Pods-Prego_Example
//
//  Created by Filipe Dias on 30/09/2019.
//

import Foundation

public protocol ResourceLoaderType {

    typealias DataType = Data
    typealias ErrorType = ResourceLoaderError
    typealias ReturnType = Result<DataType, ErrorType>
    typealias Handler = (ReturnType) -> ()

    func load(_ completion: @escaping Handler)
}

public class ResourceLoader<T>: ResourceLoaderType {

    typealias DataType = T

    private var bundle: Bundle
    private var fileName: String
    private var fileType: String

    public init(bundle: Bundle,
                fileName: String,
                fileType: String = "json") {
        self.bundle = bundle
        self.fileName = fileName
        self.fileType = fileType
    }

    public func load(_ completion: @escaping Handler) {

        DispatchQueue.global(qos: .background).async { [weak self] in
            guard let self = self else { return }
            guard let filepath = self.bundle.url(forResource: self.fileName,
                                                 withExtension: self.fileType) else {
                self.dispatch(.failure(.fileNotFound), with: completion)
                return
            }

            do {
                let data = try Data(contentsOf: filepath)
                self.dispatch(.success(data), with: completion)

            } catch (let error) {
                self.dispatch(.failure(.parseFailed(error)), with: completion)
            }

        }

    }

    private func dispatch(_ result: ResourceLoaderType.ReturnType,
                          with completion: @escaping Handler) {
        DispatchQueue.main.async {
            completion(result)
        }
    }
}
