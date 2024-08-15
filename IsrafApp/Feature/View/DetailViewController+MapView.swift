//
//  DetailViewController+MapView.swift
//  IsrafApp
//
//  Created by Emre on 15.08.2024.
//

import Foundation
import MapKit

extension DetailViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        guard let coordinate = view.annotation?.coordinate else { return }
        
        let alert = UIAlertController(title: "Yol Tarifi", message: "Yol tarifi almak ister misiniz?", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Evet", style: .default, handler: { _ in
            let placemark = MKPlacemark(coordinate: coordinate)
            let mapItem = MKMapItem(placemark: placemark)
            mapItem.name = "Selected Location"
            
            let launchOptions = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving]
            mapItem.openInMaps(launchOptions: launchOptions)
        }))
        
        alert.addAction(UIAlertAction(title: "Hayır", style: .cancel, handler: nil))
        
        present(alert, animated: true, completion: nil)
    }
}
