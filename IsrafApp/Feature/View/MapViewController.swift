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
    var selectedAnnotation: MKAnnotation?

    
    //MARK: -Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        print("MapViewController")
        setupInit()

    }
    
    func setupInit() {
        mapViewModel.delegate = self
        mapView.delegate = self
        mapViewModel.fetchFoods()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        DispatchQueue.global(qos: .background).async { [weak self] in
            self?.locationManager.requestWhenInUseAuthorization()
        }
        
        let status = locationManager.authorizationStatus
        if status == .authorizedWhenInUse || status == .authorizedAlways {
            startUpdatingLocation()
        } else {
            showAlert(title: "Konum İzni", message: "Konum izni verilmedi")
        }
    }
    
    func startUpdatingLocation() {
        DispatchQueue.main.async { [weak self] in
            self?.mapView.showsUserLocation = true
        }
        locationManager.startUpdatingLocation()
    }
    

    func openMapsForDirections(to coordinate: CLLocationCoordinate2D, title: String?) {
        let placemark = MKPlacemark(coordinate: coordinate)
        let mapItem = MKMapItem(placemark: placemark)
        
        mapItem.name = title ?? "Hedef Konum"
        DispatchQueue.main.async {
            mapItem.openInMaps(launchOptions: [
                MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving
            ])
        }
        
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
