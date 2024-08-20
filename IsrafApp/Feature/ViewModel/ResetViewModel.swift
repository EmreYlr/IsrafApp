//
//  ResetViewModel.swift
//  IsrafApp
//
//  Created by Emre on 20.08.2024.
//

import Foundation

protocol ResetViewModelProtocol {
    var delegate: ResetViewModelOutputProtocol? { get set }
    func resetPassword(email: String)
}

protocol ResetViewModelOutputProtocol: AnyObject {
    func success()
    func error(error: Error)
}

final class ResetViewModel {
    weak var delegate: ResetViewModelOutputProtocol?
    
    func resetPassword(email: String) {
        NetworkManager.shared.resetPassword(email: email) { result in
            switch result {
            case .success:
                self.delegate?.success()
            case .failure(let error):
                self.delegate?.error(error: error)
            }
        }
    }
}

extension ResetViewModel: ResetViewModelProtocol {}
