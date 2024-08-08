//
//  ViewController.swift
//  IsrafApp
//
//  Created by Emre on 5.08.2024.
//

import UIKit

final class LoginViewController: UIViewController {
    //MARK: -Variables
    @IBOutlet weak var passTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!

    private var loginViewModel: LoginViewModelProtocol = LoginViewModel()
    
    //MARK: -FUNCTIONS
    override func viewDidLoad() {
        super.viewDidLoad()
        initScreen()
    }
    
    func initScreen() {
        loginViewModel.delegate = self
        loginButton.layer.cornerRadius = 8
    }
    
    @IBAction func registerButtonClicked(_ sender: Any) {
        
    }
    
    @IBAction func loginButtonClicked(_ sender: Any) {
        loginViewModel.loginUser(email: emailTextField.text ?? "", password: passTextField.text ?? "")
    }
    
}

//MARK: LoginViewModelOutputProtocol
extension LoginViewController: LoginViewModelOutputProtocol {
    func startLoading() {
        
    }
    
    func stopLoading() {
        
    }
    
    func update(uid: String) {
        print("Giriş Başarılı")
        print("UID: \(uid)")
    }
    
    func error(error: any Error) {
        showAlert(title: "Hata", message: "E-posta veya şifre hatalı. Hata: \(error.localizedDescription)")
    }
}

