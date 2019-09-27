//
//  UIViewController+State.swift
//  Prego
//
//  Created by Filipe Dias on 13/05/2018.
//

import Foundation

enum ViewState<ViewModel, ErrorViewModel, LoadingViewModel, EmptyViewModel> {

    case loading(LoadingViewModel)
    case loaded(ViewModel)
    case error(ErrorViewModel)
    case empty(EmptyViewModel)
    case offline(ViewModel)
}

extension ViewState: CustomStringConvertible {

    public var description: String {

        switch self {
        case .loading: return "Loading"
        case .loaded:  return "Loaded"
        case .error:   return "Error"
        case .empty:   return "Empty"
        case .offline: return "Offline"
        }
    }
}
