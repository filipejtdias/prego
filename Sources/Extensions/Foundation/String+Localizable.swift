//
//  String+Localizable.swift
//  Prego
//
//  Created by Filipe Dias on 27/09/2019.
//

import Foundation

public protocol Localizable {
    var localized: String { get }
}

extension String: Localizable {

    public var localized: String {
        return NSLocalizedString(self, value: " ", comment: "")
    }
}
