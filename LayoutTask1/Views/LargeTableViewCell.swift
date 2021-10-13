//
//  LargeTableViewCell.swift
//  LayoutTask1
//
//  Created by ahmed on 10/10/2021.
//

import UIKit

class LargeTableViewCell: UITableViewCell {

    static let identifire = "LargeCell"
    @IBOutlet var largeImage: UIImageView!
    @IBOutlet var title: UILabel!
    @IBOutlet var label: UILabel!
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
        
        button.layer.cornerRadius = 22
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "LargeTableViewCell", bundle: nil)
    }
    
    func configure(with data: Data) {
        largeImage.image = UIImage(named: data.image ?? "")
        title.text = data.title ?? ""
        label.text = data.label ?? ""
        button.setTitle(data.buttonTitle ?? "", for: .normal)
    }
}
