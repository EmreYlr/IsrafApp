//
//  LoginViewModel.swift
//  IsrafApp
//
//  Created by Emre on 5.08.2024.
//

import Foundation

protocol LoginViewModelProtocol {
    var delegate: LoginViewModelOutputProtocol? { get set }
    var user: User? { get set }
    func loginUser(email: String, password: String)
    func fetchUser(uid: String)
}

protocol LoginViewModelOutputProtocol: AnyObject {
    func startLoading()
    func stopLoading()
    func update()
    func error(error: Error)
}

final class LoginViewModel {
    weak var delegate: LoginViewModelOutputProtocol?
    var user: User? = User(data: [:])
    
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
                    self.fetchUser(uid: authData.user.uid)
                case .failure(let error):
                    self.delegate?.error(error: error)
                }
                self.delegate?.stopLoading()
            }
        }
    }
    
    func fetchUser(uid: String) {
        NetworkManager.shared.getUserInfo(uid: uid) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let user):
                    self.user = user
                    self.delegate?.update()
                case .failure(let error):
                    print(error)
                }
            }
        }
        
    }
}
extension LoginViewModel: LoginViewModelProtocol {}
