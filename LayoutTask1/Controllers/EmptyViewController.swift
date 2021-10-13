//
//  EmptyViewController.swift
//  LayoutTask1
//
//  Created by ahmed on 13/10/2021.
//

import UIKit

class EmptyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Action
    @IBAction func onButtonClick(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
