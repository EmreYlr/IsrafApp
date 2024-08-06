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
        loginButtonSettings()
        print("Login!")
        
        
    }
    
    func loginButtonSettings() {
        loginButton.layer.cornerRadius = 8
    }
    
    @IBAction func registerButtonClicked(_ sender: Any) {
        
    }
    
    @IBAction func loginButtonClicked(_ sender: Any) {
    }
    
}

//MARK: LoginViewModelOutputProtocol
extension LoginViewController: LoginViewModelOutputProtocol {}

