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
        initScreen()
        print("Register")
    }
    
    func initScreen() {
        registerViewModel.delegate = self
        registerButton.layer.cornerRadius = 8
        loadIndicator.isHidden = true
        loadIndicator.color = .white
    }
    
    @IBAction func registerButtonClicked(_ sender: Any) {
        registerViewModel.registerUser(email: emailTextField.text ?? "", password: passTextField.text ?? "", firstName: nameTextField.text ?? "", lastName: lastnameTextField.text ?? "")
    }
    
    func backToLogin() {
        self.navigationController?.popViewController(animated: true)
    }
}

//MARK: -RegisterViewModelOutputProtocol
extension RegisterViewController: RegisterViewModelOutputProtocol {
    func startLoading() {
        registerButton.setTitle("", for: .normal)
        registerButton.isEnabled = false
        loadIndicator.isHidden = false
        loadIndicator.startAnimating()
    }
    
    func stopLoading() {
        registerButton.setTitle("Kayıt Ol", for: .normal)
        registerButton.isEnabled = true
        loadIndicator.stopAnimating()
        loadIndicator.isHidden = true
        
    }
    
    func update() {
        backToLogin()
        print("Update")
    }
    
    func error() {
        //TODO: - Error Alert
    }
}
