//
//  DetailViewController.swift
//  IsrafApp
//
//  Created by Emre on 10.08.2024.
//

import UIKit
import MapKit

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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("DetailViewController")
        productImageView.image = UIImage(named: "food")
        productNameLabel.text = "Burger"
        companyNameLabel.text = "Burger King"
        distanceLabel.text = "10 km"
        priceLabel.text = "100 TL"
        productImageView.layer.cornerRadius = 18
        buyButton.layer.cornerRadius = 8
        let attributedString = NSMutableAttributedString(string: "150 TL")
        attributedString.addAttribute(.strikethroughStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 0, length: attributedString.length))
        oldPriceLabel.attributedText = attributedString
        let location = CLLocationCoordinate2D(latitude: 41.015137, longitude: 28.979530)
        let region = MKCoordinateRegion(center: location, latitudinalMeters: 1000, longitudinalMeters: 1000)
        mapView.setRegion(region, animated: true)
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        mapView.addAnnotation(annotation)
        
    }
 
    
    @IBAction func buyButtonClicked(_ sender: Any) {
    }
}
