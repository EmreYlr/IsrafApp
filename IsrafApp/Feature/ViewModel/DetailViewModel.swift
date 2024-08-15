//
//  DetailViewModel.swift
//  IsrafApp
//
//  Created by Emre on 10.08.2024.
//

import Foundation
import MapKit

protocol DetailViewModelProtocol {
    var delegate: DetailViewModelOutputProtocol? { get set}
    var food: Food? { get set }
    func mapSettings(mapView: MKMapView)
}

protocol DetailViewModelOutputProtocol: AnyObject {}

final class DetailViewModel {
    weak var delegate: DetailViewModelOutputProtocol?
    var food: Food?
    
    func mapSettings(mapView: MKMapView) {
        guard let food = food else { return }
        let location = CLLocationCoordinate2D(latitude: Double(food.lat)!, longitude: Double(food.long)!)
        let region = MKCoordinateRegion(center: location, latitudinalMeters: 1000, longitudinalMeters: 1000)
        mapView.setRegion(region, animated: true)
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        mapView.addAnnotation(annotation)
    }
}

extension DetailViewModel: DetailViewModelProtocol {}
