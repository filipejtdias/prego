//
//  ViewModel2.swift
//  testKVOBindable
//
//  Created by Filipe Dias on 15/04/2021.
//

import Foundation

protocol ViewModelProtocol {
    
    typealias Completion = () -> Void
    
    var title: Bindable<String> { get }
    var enabled: Bindable<Bool> { get }
    
    func buttonPressed(_ completion: @escaping Completion)
}

extension ViewModelProtocol {
    
    var cycle: Int {
        10000
    }
}

class ViewModel: ViewModelProtocol {
    
    @Atomic var result: [String] = []
    
    var count: Int = 0
    
    private(set) var title: Bindable<String>
    private(set) var enabled: Bindable<Bool>
    
    init(title: String) {
        self.title = Bindable(title)
        self.enabled = Bindable(true)
    }
    
    func buttonPressed(_ completion: @escaping Completion) {
        
        let group = DispatchGroup()
        group.enter()
        count += 1
        
        DispatchQueue.init(label: "buttonPressed", qos: .background).async { [weak self, completion, count] in
            guard let self = self else { return }
            self.enabled.wrappedValue = false
            for i in 1...self.cycle {
                let random = "\(count) | \(i)"
                self.title.wrappedValue = random
                self.$result.mutate { $0.append(random) }
            }
            self.enabled.wrappedValue = true
            group.leave()
            
            group.notify(queue: .global(qos: .background)) { [completion] in
                completion()
            }
            
            
        }
        
    }
}
