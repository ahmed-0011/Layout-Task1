//
//  SmallTableViewCell.swift
//  LayoutTask1
//
//  Created by ahmed on 10/10/2021.
//

import UIKit

class SmallTableViewCell: UITableViewCell {

    static let identifire = "SmallCell"
    @IBOutlet var smallimage: UIImageView!
    @IBOutlet var title: UILabel!
    @IBOutlet var button: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .clear
        layer.masksToBounds = false
        layer.shadowOpacity = 0.4
        layer.shadowRadius = 8
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowColor = UIColor.lightGray.cgColor
        contentView.layer.backgroundColor = UIColor(red: 0.97, green: 0.97, blue: 0.97, alpha: 0.6).cgColor
        contentView.layer.cornerRadius = 10
        
        button.backgroundColor = .clear
        button.layer.borderWidth = 2.0
        button.layer.borderColor = UIColor(red: 0.20, green: 0.20, blue: 0.20, alpha: 1.0).cgColor
        button.layer.cornerRadius = 16
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "SmallTableViewCell", bundle: nil)
    }
    
    func configure(with data: Data) {
        smallimage.image = UIImage(named: data.image ?? "")
        title.text = data.title ?? ""
        button.setTitle(data.buttonTitle ?? "", for: .normal)
    }
}
