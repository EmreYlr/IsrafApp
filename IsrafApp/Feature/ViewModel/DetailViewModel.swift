//
//  DetailViewModel.swift
//  IsrafApp
//
//  Created by Emre on 10.08.2024.
//

import Foundation

protocol DetailViewModelProtocol {
    var delegate: DetailViewModelOutputProtocol? { get set}
    var food: Food? { get set }
}

protocol DetailViewModelOutputProtocol: AnyObject {}

final class DetailViewModel {
    weak var delegate: DetailViewModelOutputProtocol?
    var food: Food?
}

extension DetailViewModel: DetailViewModelProtocol {}
