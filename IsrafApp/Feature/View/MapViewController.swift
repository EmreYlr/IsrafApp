//
//  MapViewController.swift
//  IsrafApp
//
//  Created by Emre on 15.08.2024.
//

import UIKit
import MapKit
import CoreLocation

final class MapViewController: UIViewController {
    //MARK: -Variables
    @IBOutlet weak var mapView: MKMapView!
    var mapViewModel: MapViewModelProtocol = MapViewModel()
    private let locationManager = CLLocationManager()
    
    //MARK: -Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        print("MapViewController")
        mapViewModel.delegate = self
        mapViewModel.fetchFoods()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            switch locationManager.authorizationStatus {
            case .notDetermined, .restricted, .denied:
                locationManager.requestWhenInUseAuthorization()
            case .authorizedWhenInUse, .authorizedAlways:
                mapView.showsUserLocation = true
                locationManager.startUpdatingLocation()
            @unknown default:
                break
            }
        } else {
            print("Location services are not enabled")
        }
    }
    
    
    
}
extension MapViewController: MapViewModelOutputProtocol {
    func update() {
        mapView.removeAnnotations(mapView.annotations)
        for food in mapViewModel.foods {
            if let latitude = Double(food.lat), let longitude = Double(food.long) {
                let location = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
                let annotation = MKPointAnnotation()
                annotation.coordinate = location
                annotation.title = food.companyName
                annotation.subtitle = food.foodName
                mapView.addAnnotation(annotation)
            }
        }
    }
    
    func error() {
        print("Failed to fetch food data.")
    }
}
extension MapViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let userLocation = locations.last else { return }
        locationManager.stopUpdatingLocation()
        let region = MKCoordinateRegion(center: userLocation.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
        mapView.setRegion(region, animated: true)
        
        let userAnnotation = MKPointAnnotation()
        userAnnotation.coordinate = userLocation.coordinate
        userAnnotation.title = "Your Location"
        mapView.addAnnotation(userAnnotation)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Failed to get user location: \(error)")
    }
    
}
