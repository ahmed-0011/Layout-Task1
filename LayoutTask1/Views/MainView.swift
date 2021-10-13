//
//  MainView2.swift
//  LayoutTask1
//
//  Created by ahmed on 12/10/2021.
//

import UIKit

protocol MainViewDelegate {
    func onButtonClick(type: String)
}

class MainView: UIView {
    
    @IBOutlet var tableView: UITableView!
    var data: [Data] = []
    var delegate: MainViewDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
        initTableView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
        initTableView()
    }
    
    func commonInit() {
        let view = Bundle(for: MainView.self).loadNibNamed("\(MainView.self)", owner: self)?.first as! UIView
      
        // another method to load nib files
        // let view = UINib(nibName: "MainView", bundle: .main).instantiate(withOwner: self, options: nil).first as! UIView
        addSubview(view)
     }
     
     func initTableView() {
         tableView.register(SmallTableViewCell.nib(), forCellReuseIdentifier: SmallTableViewCell.identifire)
         tableView.register(LargeTableViewCell.nib(), forCellReuseIdentifier: LargeTableViewCell.identifire)
         tableView.delegate = self
         tableView.dataSource = self
     }
 }


// MARK: - Table View Data Source
extension MainView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: LargeTableViewCell.identifire) as? LargeTableViewCell {
                cell.configure(with: data[indexPath.row], delegate!)
                return cell
            }
        }
        else {
            if let cell = tableView.dequeueReusableCell(withIdentifier: SmallTableViewCell.identifire) as? SmallTableViewCell {
                cell.configure(with: data[indexPath.row], delegate!)
                return cell
            }
        }
        return UITableViewCell()
    }
}

// MARK: - Table View Delegate
extension MainView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
