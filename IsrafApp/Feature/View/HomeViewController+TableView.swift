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
        cell.mainCellConfiguration(with: "Burger", with: "10 KM", with: "Burger King", with: "150 TL", with: "150 TL")
        return cell
    }
}
