//
//  FileStorage.swift
//  Prego
//
//  Created by Filipe Dias on 27/09/2019.
//

import Foundation

public class FileStorage: FileStorageType {

    let fileManager: FileManagerType

    public init(fileManager: FileManagerType) {
        self.fileManager = fileManager
    }

    private func urlPath(for directory: FileManager.SearchPathDirectory,
                         fileName: String,
                         isDirectory: Bool = false) -> URL? {
        guard let searchURL = searchURL(for: directory) else { return nil }
        return searchURL.appendingPathComponent(fileName, isDirectory: isDirectory)
    }

    private func searchURL(for directory: FileManager.SearchPathDirectory) -> URL? {
        return fileManager.urls(for: directory,
                                in: .userDomainMask).first
    }

    private func createFile<T: Encodable>(_ object: T,
                                          path url: URL,
                                          with encoder: JSONEncoder) -> Bool {
        do {
            let data = try encoder.encode(object)
            if fileManager.fileExists(atPath: url.path) {
                try? fileManager.removeItem(at: url)
            }
            let success: Bool = fileManager.createFile(atPath: url.path,
                                                       contents: data,
                                                       attributes: nil)
            return success
        } catch {
            return false
        }

    }

    // MARK: StorageType
    public func save<T: Encodable>(_ object: T,
                            to directory: FileManager.SearchPathDirectory,
                            as fileName: String,
                            with encoder: JSONEncoder,
                            completion: ((_ success: Bool) -> ())?) {
        DispatchQueue.global(qos: .background).async { [weak self] in
            guard let `self` = self else {
                completion?(false)
                return
            }
            guard let url = self.urlPath(for: directory, fileName: fileName) else {
                completion?(false)
                return
            }
            let success: Bool = self.createFile(object, path: url, with: encoder)
            completion?(success)
        }

    }

    public func retrieve<T: Decodable>(_ fileName: String,
                                from directory: FileManager.SearchPathDirectory,
                                as type: T.Type,
                                with decoder: JSONDecoder) -> T? {
        guard let url = urlPath(for: directory, fileName: fileName) else { return nil }
        guard let data = fileManager.contents(atPath: url.path) else { return nil }
        return try? decoder.decode(type, from: data)
    }

    public func delete(_ fileName: String,
                from directory: FileManager.SearchPathDirectory) {
        guard let url = urlPath(for: directory, fileName: fileName) else { return }
        try? fileManager.removeItem(at: url)
    }

}
