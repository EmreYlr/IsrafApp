//
//  LoginViewModel.swift
//  IsrafApp
//
//  Created by Emre on 5.08.2024.
//

import Foundation

protocol LoginViewModelProtocol {
    var delegate: LoginViewModelOutputProtocol? { get set }
    func loginUser(email: String, password: String)
}

protocol LoginViewModelOutputProtocol: AnyObject {
    func startLoading()
    func stopLoading()
    func update(uid: String)
    func error(error: Error)
}

final class LoginViewModel {
    weak var delegate: LoginViewModelOutputProtocol?
    
    func loginUser(email: String, password: String) {
        if email.isEmpty || password.isEmpty {
            self.delegate?.error(error: NSError(domain: "Error", code: 0, userInfo: [NSLocalizedDescriptionKey: "Email and password can not be empty"]))
            return
        }
        self.delegate?.startLoading()
        NetworkManager.shared.loginUser(email: email, password: password) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let authData):
                    self.delegate?.update(uid: authData.user.uid)
                case .failure(let error):
                    self.delegate?.error(error: error)
                }
                self.delegate?.stopLoading()
            }
        }
    }
}
extension LoginViewModel: LoginViewModelProtocol {}
