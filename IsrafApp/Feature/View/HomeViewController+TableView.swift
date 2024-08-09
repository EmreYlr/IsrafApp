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
        return 10 // Toplam hücre sayısı
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 210
    }
    
    // Her bir hücre arasında boşluk oluşturmak için section header yüksekliği ekleyebilirsiniz.
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10 // Her hücre arasında 10 pt boşluk
    }
    
    // Boş header view return edin.
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .clear // Şeffaf bir görünüm oluşturun
        return headerView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? OrderTableViewCell else {
            return UITableViewCell()
        }
        cell.foodImageView.image = UIImage(named: "food")
        cell.foodNameLabel.text = "Burger"
        cell.distanceLabel.text = "10 KM"
        cell.companyNameLabel.text = "Burger King"
        cell.priceLabel.text = "130 TL"
        cell.foodImageView.layer.cornerRadius = 18
        return cell
    }
}
