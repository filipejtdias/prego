//
//  FileManagerType.swift
//  Prego
//
//  Created by Filipe Dias on 27/09/2019.
//

import Foundation

public protocol FileManagerType {

    func urls(for directory: FileManager.SearchPathDirectory,
              in domainMask: FileManager.SearchPathDomainMask) -> [URL]

    func fileExists(atPath path: String) -> Bool

    func removeItem(at URL: URL) throws

    func createFile(atPath path: String,
                    contents data: Data?,
                    attributes attr: [FileAttributeKey: Any]?) -> Bool

    func contents(atPath path: String) -> Data?
}

extension FileManager: FileManagerType {}
