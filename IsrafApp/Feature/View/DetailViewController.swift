//
//  DetailViewController.swift
//  IsrafApp
//
//  Created by Emre on 10.08.2024.
//

import UIKit
import MapKit
import Kingfisher

class DetailViewController: UIViewController {
    //MARK: -Variables
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var buyButton: UIButton!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var oldPriceLabel: UILabel!
    @IBOutlet weak var companyNameLabel: UILabel!
    
    var detailViewModel: DetailViewModelProtocol = DetailViewModel()
    
    //MARK: -FUNCTIONS
    override func viewDidLoad() {
        super.viewDidLoad()
        print("DetailViewController")
        mapView.delegate = self
        productImageView.layer.cornerRadius = 18
        buyButton.layer.cornerRadius = 8
        detailSetting()
        detailViewModel.mapSettings(mapView: mapView)
    }
    
    
    func detailSetting() {
        guard let food = detailViewModel.food else {
            showAlert(title: "Hata", message: "Ürün bilgileri alınamadı.")
            return
        }
        productImageView.kf.setImage(with: URL(string: food.imageURL))
        productNameLabel.text = "YEMEK: \(food.foodName)"
        companyNameLabel.text = "LOKANTA: \(food.companyName)"
        distanceLabel.text = "MESAFE: \(food.distance)"
        priceLabel.text = food.newPrice == "0 TL" ? "BEDAVA" : food.newPrice
        
        let attributedString = NSMutableAttributedString(string: food.oldPrice)
        attributedString.addAttribute(.strikethroughStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 0, length: attributedString.length))
        oldPriceLabel.attributedText = attributedString
    }

 
    
    @IBAction func buyButtonClicked(_ sender: Any) {}
}
