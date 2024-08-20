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
    func fetchUser()
    var user: User? { get set }
}

protocol ProfileViewModelOutputProtocol: AnyObject {
    func update()
    func error()
}

final class ProfileViewModel{
    weak var delegate: ProfileViewModelOutputProtocol?
    var user: User? = User(data: [:])
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
    func fetchUser() {
        user = NetworkManager.shared.tempUser
    }
}

extension ProfileViewModel: ProfileViewModelProtocol {}
