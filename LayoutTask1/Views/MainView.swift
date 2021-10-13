//
//  MainView2.swift
//  LayoutTask1
//
//  Created by ahmed on 12/10/2021.
//

import UIKit

protocol MainViewDelegate {
    var data: [Data] { get }
}

class MainView: UIView {
    
    @IBOutlet var tableView: UITableView!
    var delegate: MainViewDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        tableViewInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func commonInit() {
        let view = Bundle(for: MainView.self).loadNibNamed("\(MainView.self)", owner: self)?.first as! UIView
      
        // another method to load nib files
        // let view = UINib(nibName: "MainView", bundle: .main).instantiate(withOwner: self, options: nil).first as! UIView
        addSubview(view)
     }
     
     func tableViewInit() {
         tableView.register(SmallTableViewCell.nib(), forCellReuseIdentifier: SmallTableViewCell.identifire)
         tableView.register(LargeTableViewCell.nib(), forCellReuseIdentifier: LargeTableViewCell.identifire)
         tableView.delegate = self
         tableView.dataSource = self
     }
 }


// MARK: - Table View Data Source
extension MainView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return (delegate?.data.count)!
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        if section != 2 {
            return 15.0
        }
        return 0.0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: LargeTableViewCell.identifire) as? LargeTableViewCell {
                cell.configure(with: delegate?.data[indexPath.section] ?? Data())
                return cell
            }
        }
        else {
            if let cell = tableView.dequeueReusableCell(withIdentifier: SmallTableViewCell.identifire) as? SmallTableViewCell {
                cell.configure(with: delegate?.data[indexPath.section] ?? Data())
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
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.layer.masksToBounds = true
    }
    
    func tableView(_ tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
        let header = view as! UITableViewHeaderFooterView
        header.contentView.backgroundColor = UIColor(red: 0.94, green: 0.94, blue: 0.94, alpha: 0.8)
    }
}
