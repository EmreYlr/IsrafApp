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
    var foods: [Food] { get set }
    func fetchFoods()
}
protocol HomeViewModelOutputProtocol: AnyObject {
    func update()
    func error()
}

final class HomeViewModel {
    var delegate: HomeViewModelOutputProtocol?
    var user: User? = User(data: [:])
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
extension HomeViewModel: HomeViewModelProtocol {}
