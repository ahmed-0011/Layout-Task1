//
//  ViewController.swift
//  LayoutTask1
//
//  Created by ahmed on 10/10/2021.
//

import UIKit

class MainViewController: UIViewController, MainViewDelegate {
    
    @IBOutlet var mainView: MainView!
    var data: [Data] = TableData.getData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.data = data
        mainView.delegate = self
    }
    
    // MARK: - Main View Delegate
    func onButtonClick(type: String) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "EmptyViewController") as? EmptyViewController {
            
            if type == LargeTableViewCell.identifire {
                vc.view.backgroundColor = .red
            } else {
                vc.view.backgroundColor = .green
            }
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true, completion: nil)
        }
    }
}


