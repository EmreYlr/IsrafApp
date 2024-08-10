//
//  DetailViewModel.swift
//  IsrafApp
//
//  Created by Emre on 10.08.2024.
//

import Foundation

protocol DetailViewModelProtocol {
    var delegate: DetailViewModelOutputProtocol? { get set}
}

protocol DetailViewModelOutputProtocol: AnyObject {}

final class DetailViewModel {
    weak var delegate: DetailViewModelOutputProtocol?
}

extension DetailViewModel: DetailViewModelProtocol {}
