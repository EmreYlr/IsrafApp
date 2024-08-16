//
//  MapViewModel.swift
//  IsrafApp
//
//  Created by Emre on 15.08.2024.
//

import Foundation

protocol MapViewModelProtocol {
    var delegate: MapViewModelOutputProtocol? { get set }
    var foods: [Food] { get set }
    func fetchFoods()
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
}

extension MapViewModel: MapViewModelProtocol {}
