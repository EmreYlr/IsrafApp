//
//  HomeViewController+TableView.swift
//  IsrafApp
//
//  Created by Emre on 9.08.2024.
//

import Foundation
import UIKit

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 210
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 15
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView()
        footerView.backgroundColor = .clear
        return footerView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? OrderTableViewCell else {
            return UITableViewCell()
        }
        cell.foodImageView.image = UIImage(named: "food")
        cell.foodNameLabel.text = "Burger"
        cell.distanceLabel.text = "10 KM"
        cell.companyNameLabel.text = "Burger King"
        cell.priceLabel.text = "100 TL"
        
        let attributedString = NSMutableAttributedString(string: "150 TL")
        attributedString.addAttribute(.strikethroughStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 0, length: attributedString.length))
        
        cell.oldPriceLabel.attributedText = attributedString
        cell.foodImageView.layer.cornerRadius = 18
        cell.foodImageView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        cell.foodImageView.layer.masksToBounds = true
        return cell
    }
}
