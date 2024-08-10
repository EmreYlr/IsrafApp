//
//  OrderTableViewCell.swift
//  IsrafApp
//
//  Created by Emre on 9.08.2024.
//

import UIKit

final class OrderTableViewCell: UITableViewCell {
    
    @IBOutlet weak var foodImageView: UIImageView!
    @IBOutlet weak var foodNameLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var companyNameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var oldPriceLabel: UILabel!
    @IBOutlet weak var bottomView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.borderWidth = 1
        layer.cornerRadius = 18
        bottomView.layer.cornerRadius = 18
        bottomView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        bottomView.layer.masksToBounds = true
        foodImageView.layer.cornerRadius = 18
        foodImageView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        foodImageView.layer.masksToBounds = true
    }

    func mainCellConfiguration(with foodName: String, with distance: String, with companyName: String, with price: String, with oldPrice: String) {
        foodNameLabel.text = foodName
        distanceLabel.text = distance
        companyNameLabel.text = companyName
        priceLabel.text = price == "0 TL" ? "BEDAVA" : price 
        //Üzerini çizmek için
        let attributedString = NSMutableAttributedString(string: oldPrice)
        attributedString.addAttribute(.strikethroughStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 0, length: attributedString.length))
        oldPriceLabel.attributedText = attributedString
    }
}
