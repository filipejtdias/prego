//
//  HTTPSession.swift
//  Prego
//
//  Created by Filipe Dias on 27/09/2019.
//

import Foundation

public protocol HTTPSession {
    
    var endpoint: URL? { get }
    var urlSession: URLSession { get }
}
