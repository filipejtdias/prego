//
//  FileStorageType.swift
//  Prego
//
//  Created by Filipe Dias on 27/09/2019.
//

import Foundation

public protocol FileStorageType {

    func save<T: Encodable>(_ object: T,
                            to directory: FileManager.SearchPathDirectory,
                            as fileName: String,
                            with encoder: JSONEncoder,
                            completion: ((_ success: Bool) -> ())?)
    func retrieve<T: Decodable>(_ fileName: String,
                                from directory: FileManager.SearchPathDirectory,
                                as type: T.Type,
                                with decoder: JSONDecoder) -> T?
    func delete(_ fileName: String,
                from directory: FileManager.SearchPathDirectory)
}
