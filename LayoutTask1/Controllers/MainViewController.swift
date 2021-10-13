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
        mainView.delegate = self
    }
}


