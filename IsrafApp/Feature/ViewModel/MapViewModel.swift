//
//  MapViewModel.swift
//  IsrafApp
//
//  Created by Emre on 15.08.2024.
//

import Foundation
import MapKit

protocol MapViewModelProtocol {
    var delegate: MapViewModelOutputProtocol? { get set }
    var foods: [Food] { get set }
    func fetchFoods()
    func foodSetup(mapView: MKMapView)
}

protocol MapViewModelOutputProtocol: AnyObject {
    func update()
    func error()
}

final class MapViewModel {
    weak var delegate: MapViewModelOutputProtocol?
    var foods: [Food] = []
    func fetchFoods() {
        NetworkManager.shared.fetchFoods { [weak self] foods in
            guard let self = self, let foods = foods else {
                self?.delegate?.error()
                return
            }
            self.foods = foods
            DispatchQueue.main.async {
                self.delegate?.update()
            }
        }
    }
    
    func foodSetup(mapView: MKMapView) {
        mapView.removeAnnotations(mapView.annotations)
        for food in foods {
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
}

extension MapViewModel: MapViewModelProtocol {}
