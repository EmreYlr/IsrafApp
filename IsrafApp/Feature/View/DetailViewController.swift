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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("DetailViewController")
        productImageView.layer.cornerRadius = 18
        buyButton.layer.cornerRadius = 8
        detailSetting()
    }
    
    
    func detailSetting() {
        guard let food = detailViewModel.food else {
            //TODO: -ADD ALERT
            return
        }
        productImageView.kf.setImage(with: URL(string: food.imageURL))
        productNameLabel.text = food.foodName
        companyNameLabel.text = food.companyName
        distanceLabel.text = food.distance
        priceLabel.text = food.newPrice
        
        let attributedString = NSMutableAttributedString(string: food.oldPrice)
        attributedString.addAttribute(.strikethroughStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 0, length: attributedString.length))
        oldPriceLabel.attributedText = attributedString
        mapSettings(food: food)
    }
    
    func mapSettings(food: Food){
        let location = CLLocationCoordinate2D(latitude: Double(food.lat)!, longitude: Double(food.long)!)
        let region = MKCoordinateRegion(center: location, latitudinalMeters: 1000, longitudinalMeters: 1000)
        mapView.setRegion(region, animated: true)
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        mapView.addAnnotation(annotation)
    }
 
    
    @IBAction func buyButtonClicked(_ sender: Any) {
    }
}
