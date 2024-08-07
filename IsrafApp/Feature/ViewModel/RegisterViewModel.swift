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
    func error()
}

final class RegisterViewModel {
    weak var delegate: RegisterViewModelOutputProtocol?
    
    func registerUser(email: String, password: String, firstName: String, lastName: String) {
        if email.isEmpty || password.isEmpty {
            return
        }
        self.delegate?.startLoading()
        NetworkManager.shared.registerUser(email: email, password: password, firstName: firstName, lastName: lastName) { result in

            switch result {
            case .success(let authResult):
                //print(authResult)
                self.delegate?.update()
            case .failure(let error):
                print(error)
                self.delegate?.error()
            }
            self.delegate?.stopLoading()
        }
    }
    
}

extension RegisterViewModel: RegisterViewModelProtocol {}
