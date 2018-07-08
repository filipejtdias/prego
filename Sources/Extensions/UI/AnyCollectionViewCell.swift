//
//  AnyCollectionViewCell.swift
//  Prego
//
//  Created by Filipe Dias on 08/07/2018.
//

import Foundation

public protocol AnyCollectionViewCellStrategyProtocol {
    
    associatedtype CellViewModelType
    var viewModel: CellViewModelType { get set }
    
    func dequeueCell(in collectionView: UICollectionView, at indexPath: IndexPath) -> UICollectionViewCell
    func sizeForCell(in collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, at indexPath: IndexPath) -> CGSize
    func insetForSection(in collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, at section: Int) -> UIEdgeInsets
    func shouldSelectCell(at indexPath: IndexPath) -> Bool
    func didSelectCell(in collectionView: UICollectionView, at indexPath: IndexPath)
}

public extension AnyCollectionViewCellStrategyProtocol {
    
    public func insetForSection(in collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, at section: Int) -> UIEdgeInsets {
        
        return .zero
    }
    
    public func shouldSelectCell(at indexPath: IndexPath) -> Bool {
        
        return true
    }
    
    public func didSelectCell(in collectionView: UICollectionView, at indexPath: IndexPath) {
        
    }
    
}

public struct AnyCollectionViewCellStrategy<CellViewModelType>: AnyCollectionViewCellStrategyProtocol {
    
    public var viewModel: CellViewModelType
    
    private let _dequeue: (_ collectionView: UICollectionView, _ indexPath: IndexPath) -> UICollectionViewCell
    private let _sizeForCell: (_ collectionView: UICollectionView, _ layout: UICollectionViewLayout, _ indexPath: IndexPath) -> CGSize
    private let _insetForSection: (_ collectionView: UICollectionView,_ layout: UICollectionViewLayout,_ section: Int) -> UIEdgeInsets
    private let _shouldSelectCell: (_ indexPath: IndexPath) -> Bool
    private let _didSelectCell: (_ collectionView: UICollectionView, _ indexPath: IndexPath) -> ()
    
    public init<Strategy: AnyCollectionViewCellStrategyProtocol>(_ cellStrategy: Strategy) where Strategy.CellViewModelType == CellViewModelType {
        viewModel         = cellStrategy.viewModel
        _dequeue          = cellStrategy.dequeueCell
        _sizeForCell      = cellStrategy.sizeForCell
        _insetForSection  = cellStrategy.insetForSection
        _shouldSelectCell = cellStrategy.shouldSelectCell
        _didSelectCell    = cellStrategy.didSelectCell
    }
    
    public func dequeueCell(in collectionView: UICollectionView, at indexPath: IndexPath) -> UICollectionViewCell {
        
        return _dequeue(collectionView, indexPath)
    }
    
    public func sizeForCell(in collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, at indexPath: IndexPath) -> CGSize {
        
        return _sizeForCell(collectionView, collectionViewLayout, indexPath)
    }
    
    public func insetForSection(in collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, at section: Int) -> UIEdgeInsets {
        
        return _insetForSection(collectionView, collectionViewLayout, section)
    }
    
    public func shouldSelectCell(at indexPath: IndexPath) -> Bool {
        
        return _shouldSelectCell(indexPath)
    }
    
    public func didSelectCell(in collectionView: UICollectionView, at indexPath: IndexPath) {
        
        return _didSelectCell(collectionView, indexPath)
    }
    
}
