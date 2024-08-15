//
//  MapViewModel.swift
//  IsrafApp
//
//  Created by Emre on 15.08.2024.
//

import Foundation

protocol MapViewModelProtocol {
    var delegate: MapViewModelOutputProtocol? { get set }
}

protocol MapViewModelOutputProtocol: AnyObject {}

final class MapViewModel {
    weak var delegate: MapViewModelOutputProtocol?
}

extension MapViewModel: MapViewModelProtocol {}
