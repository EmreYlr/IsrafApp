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
    let locationManager = CLLocationManager()
    
    //MARK: -Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        print("MapViewController")
        setupInit()
        
        let status = locationManager.authorizationStatus
        if status == .authorizedWhenInUse || status == .authorizedAlways {
            startUpdatingLocation()
        } else {
            showAlert(title: "Konum İzni", message: "Konum izni verilmedi")
        }
        
    }
    
    func setupInit() {
        mapViewModel.delegate = self
        mapViewModel.fetchFoods()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        DispatchQueue.global(qos: .background).async { [weak self] in
            self?.locationManager.requestWhenInUseAuthorization()
        }
        
    }
    
    func startUpdatingLocation() {
        DispatchQueue.main.async { [weak self] in
            self?.mapView.showsUserLocation = true
        }
        locationManager.startUpdatingLocation()
    }
    
}
//MARK: -MapViewModelOutputProtocol
extension MapViewController: MapViewModelOutputProtocol {
    func update() {
        mapViewModel.foodSetup(mapView: mapView)
    }
    
    func error() {
        print("Failed to fetch food data.")
    }
}
