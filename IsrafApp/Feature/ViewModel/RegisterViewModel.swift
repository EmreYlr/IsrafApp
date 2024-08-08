//
//  RegisterViewModel.swift
//  IsrafApp
//
//  Created by Emre on 7.08.2024.
//

import Foundation
import UIKit

protocol RegisterViewModelProtocol {
    var delegate: RegisterViewModelOutputProtocol? { get set }
    func registerUser(email: String, password: String, firstName: String, lastName: String)
}

protocol RegisterViewModelOutputProtocol: AnyObject {
    func startLoading()
    func stopLoading()
    func update()
    func error(error: Error)
}

final class RegisterViewModel {
    weak var delegate: RegisterViewModelOutputProtocol?
    
    func registerUser(email: String, password: String, firstName: String, lastName: String) {
        if email.isEmpty || password.isEmpty {
            self.delegate?.error(error: NSError(domain: "Error", code: 0, userInfo: [NSLocalizedDescriptionKey: "Email and password can not be empty"]))
            return
        }
        self.delegate?.startLoading()
        NetworkManager.shared.registerUser(email: email, password: password, firstName: firstName, lastName: lastName) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(_):
                    self.delegate?.update()
                case .failure(let error):
                    self.delegate?.error(error: error)
                }
                self.delegate?.stopLoading()
            }
        }
    }
}

extension RegisterViewModel: RegisterViewModelProtocol {}
