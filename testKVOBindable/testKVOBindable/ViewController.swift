//
//  ViewController.swift
//  testKVOBindable
//
//  Created by Filipe Dias on 15/04/2021.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var myButton: UIButton!
    
    var viewModel: ViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewModel()
    }
    
    private func setupViewModel() {
        
        viewModel = ViewModel(title: "Start2")
        
        myLabel.textAdd(bind: viewModel.title)
//        myButton.enabledAddAndNotify(bind: viewModel.enabled)
    }

    @IBAction func myButton(_ sender: UIButton) {
        
        viewModel.buttonPressed() { }
    }
    
}

extension UILabel {
    
    func textAdd(bind bindable: Bindable<String>) {
        
        bindable.add { [weak self] newValue in
            guard let self = self else { return }
            print(newValue!)
            self.text = newValue
            
        }
    }
    
    func textAddAndNotify(bind bindable: Bindable<String>) {
        
        bindable.addAndNotify { [weak self] initialOrNewValue in
            guard let self = self else { return }
            print(initialOrNewValue!)
            self.text = initialOrNewValue
        }
        
    }
    
}

extension UIButton {
    
    func enabledAddAndNotify(bind bindable: Bindable<Bool>) {
        
        bindable.addAndNotify { [weak self] initialOrNewValue in
            guard let self = self else { return }
            self.isEnabled = initialOrNewValue ?? false
        }
        
    }
    
}
