//
//  MapViewController.swift
//  IsrafApp
//
//  Created by Emre on 15.08.2024.
//

import UIKit
import MapKit

final class MapViewController: UIViewController {
    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("MapViewController")
        let location = CLLocationCoordinate2D(latitude: 41.0082, longitude: 28.9784)
        let region = MKCoordinateRegion(center: location, latitudinalMeters: 1000, longitudinalMeters: 1000)
        mapView.setRegion(region, animated: true)
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        mapView.addAnnotation(annotation)
    }
    

}
