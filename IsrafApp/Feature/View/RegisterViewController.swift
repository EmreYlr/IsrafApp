//
//  RegisterViewController.swift
//  IsrafApp
//
//  Created by Emre on 5.08.2024.
//

import UIKit

final class RegisterViewController: UIViewController {
    //MARK: -Variables
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var lastnameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passTextField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var loadIndicator: UIActivityIndicatorView!
    
    var registerViewModel: RegisterViewModelProtocol = RegisterViewModel()
    
    //MARK: -FUNCTIONS
    override func viewDidLoad() {
        super.viewDidLoad()
        registerViewModel.delegate = self
        registerButtonSettings()
        loadIndicator.isHidden = true
        print("Register")
    }
    func registerButtonSettings() {
        registerButton.layer.cornerRadius = 8
    }
    
    @IBAction func registerButtonClicked(_ sender: Any) {
        registerViewModel.registerUser(email: emailTextField.text ?? "", password: passTextField.text ?? "")
    }
}

extension RegisterViewController: RegisterViewModelOutputProtocol {
    func startLoading() {
        loadIndicator.isHidden = false
        loadIndicator.startAnimating()
    }
    
    func stopLoading() {
        loadIndicator.stopAnimating()
        loadIndicator.isHidden = true
        
    }
    
    func update() {
        print("Update")
    }
    
    func error() {
        
    }
}
