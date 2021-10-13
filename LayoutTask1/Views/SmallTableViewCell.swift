//
//  SmallTableViewCell.swift
//  LayoutTask1
//
//  Created by ahmed on 10/10/2021.
//

import UIKit

class SmallTableViewCell: UITableViewCell {

    static let identifire = "SmallCell"
    var delegate: MainViewDelegate?
    @IBOutlet var view: UIView!
    @IBOutlet var smallImage: UIImageView!
    @IBOutlet var title: UILabel!
    @IBOutlet var button: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "SmallTableViewCell", bundle: nil)
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
        smallImage.clipsToBounds = true
        smallImage.layer.cornerRadius = 10
        smallImage.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
    }
    
    func initButton() {
        button.backgroundColor = .clear
        button.layer.borderWidth = 1.0
        button.layer.borderColor = UIColor(red: 0.20, green: 0.20, blue: 0.20, alpha: 1.0).cgColor
        button.layer.cornerRadius = 18
    }
    
    func configure(with data: Data, _ delegate: MainViewDelegate) {
        initView()
        initImage()
        initButton()
        self.delegate = delegate
        smallImage.image = UIImage(named: data.image ?? "")
        title.text = data.title ?? ""
        button.setTitle(data.buttonTitle ?? "", for: .normal)
    }
    
    @IBAction func onButtonClick(_ sender: Any) {
        delegate?.onButtonClick(type: SmallTableViewCell.identifire)
    }
    
}
