//
//  MapViewController+MapView.swift
//  IsrafApp
//
//  Created by Emre on 18.08.2024.
//

import Foundation
import MapKit

extension MapViewController: CLLocationManagerDelegate, MKMapViewDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse || status == .authorizedAlways {
            DispatchQueue.global(qos: .userInitiated).async { [weak self] in
                self?.startUpdatingLocation()
            }
        } else {
            showAlert(title: "Error", message: "Konum izni verilmedi!")
        }
    }
    
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
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKPointAnnotation {
            let identifier = "UserLocationAnnotation"
            var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
            
            if annotationView == nil {
                annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                annotationView?.canShowCallout = true
                
                let image = UIImage(systemName: "fork.knife.circle")
                let resizedImage = image?.withConfiguration(UIImage.SymbolConfiguration(pointSize: 25, weight: .regular))
                annotationView?.image = resizedImage
                
                let button = UIButton(type: .detailDisclosure)
                annotationView?.rightCalloutAccessoryView = button
            } else {
                annotationView?.annotation = annotation
            }
            
            return annotationView
        }
        
        return nil
    }

    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        guard let annotation = view.annotation else { return }
        
        let alertController = UIAlertController(title: "Yol Tarifi", message: "Yol tarifi almak ister misiniz?", preferredStyle: .alert)
        
        let yesAction = UIAlertAction(title: "Evet", style: .default) { [weak self] _ in
            self?.openMapsForDirections(to: annotation.coordinate, title: annotation.title ?? "")
        }
        let noAction = UIAlertAction(title: "Hayır", style: .cancel)
        
        alertController.addAction(yesAction)
        alertController.addAction(noAction)
        
        present(alertController, animated: true)
    }


}

