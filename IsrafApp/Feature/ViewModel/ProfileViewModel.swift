//
//  ProfileViewModel.swift
//  IsrafApp
//
//  Created by Emre on 18.08.2024.
//

import Foundation

protocol ProfileViewModelProtocol {
    var delegate: ProfileViewModelOutputProtocol? { get set }
    func singoutUser()
}

protocol ProfileViewModelOutputProtocol: AnyObject {
    func update()
    func error()
}

final class ProfileViewModel{
    weak var delegate: ProfileViewModelOutputProtocol?
    func singoutUser() {
        NetworkManager.shared.signOutUser { [weak self] result in
            switch result {
            case .success:
                self?.delegate?.update()
            case .failure(_):
                self?.delegate?.error()
            }
        }
    }
}

extension ProfileViewModel: ProfileViewModelProtocol {}
