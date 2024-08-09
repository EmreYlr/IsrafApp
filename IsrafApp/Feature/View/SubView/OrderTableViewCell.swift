//
//  OrderTableViewCell.swift
//  IsrafApp
//
//  Created by Emre on 9.08.2024.
//

import UIKit

class OrderTableViewCell: UITableViewCell {

    @IBOutlet weak var foodImageView: UIImageView!
    @IBOutlet weak var foodNameLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var companyNameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var oldPriceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.borderWidth = 0.5
        layer.cornerRadius = 18
    }

//    func mainCellConfiguration(with imageURL: URL, with name: String) {
//        cellImageView.layer.cornerRadius = 18
//        DispatchQueue.main.async { [self] in
//            cellImageView.kf.indicatorType = .activity
//            cellImageView.kf.setImage(with: imageURL)
//            cellLabel.text = name
//        }
//    }
    
}
