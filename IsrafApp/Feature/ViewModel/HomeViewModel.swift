//
//  HomeViewModel.swift
//  IsrafApp
//
//  Created by Emre on 8.08.2024.
//

import Foundation

protocol HomeViewModelProtocol {
    var delegate: HomeViewModelOutputProtocol? { get set }
    var user: User? { get set }
}
protocol HomeViewModelOutputProtocol: AnyObject {
    
}

final class HomeViewModel {
    var delegate: HomeViewModelOutputProtocol?
    var user: User? = User(data: [:])
    
    
}
extension HomeViewModel: HomeViewModelProtocol {}
