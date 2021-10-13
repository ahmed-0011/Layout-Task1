//
//  LargeTableViewCell.swift
//  LayoutTask1
//
//  Created by ahmed on 10/10/2021.
//

import UIKit

class LargeTableViewCell: UITableViewCell {

    static let identifire = "LargeCell"
    var delegate: MainViewDelegate?
    @IBOutlet var view: UIView!
    @IBOutlet var largeImage: UIImageView!
    @IBOutlet var title: UILabel!
    @IBOutlet var label: UILabel!
    @IBOutlet var button: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "LargeTableViewCell", bundle: nil)
    }
    
    func initView() {
        backgroundColor = .clear
        view.layer.masksToBounds = false
        view.layer.shadowOpacity = 0.4
        view.layer.shadowRadius = 8
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        view.layer.shadowColor = UIColor.lightGray.cgColor
        view.layer.cornerRadius = 10
    }
    
    func initImage() {
        largeImage.clipsToBounds = true
        largeImage.layer.cornerRadius = 10
        largeImage.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
    func initButton() {
        button.layer.cornerRadius = 24
    }
    
    func configure(with data: Data, _ delegate: MainViewDelegate) {
        initView()
        initImage()
        initButton()
        self.delegate = delegate
        largeImage.image = UIImage(named: data.image ?? "")
        title.text = data.title ?? ""
        label.text = data.label ?? ""
        button.setTitle(data.buttonTitle ?? "", for: .normal)
    }
    
    @IBAction func onButtonClick(_ sender: Any) {
        delegate?.onButtonClick(type: LargeTableViewCell.identifire)
    }
}
