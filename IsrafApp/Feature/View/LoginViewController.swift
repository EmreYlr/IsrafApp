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
    @IBOutlet weak var loadIndicator: UIActivityIndicatorView!
    
    private var loginViewModel: LoginViewModelProtocol = LoginViewModel()
    
    //MARK: -FUNCTIONS
    override func viewDidLoad() {
        super.viewDidLoad()
        initScreen()
        emailTextField.text = "yeleremre@hotmail.com"
        passTextField.text = "123456"
    }
    
    func initScreen() {
        loginViewModel.delegate = self
        loginButton.layer.cornerRadius = 8
        loadIndicator.color = .white
        loadIndicator.isHidden = true
    }
    
    @IBAction func registerButtonClicked(_ sender: Any) {}
    
    @IBAction func loginButtonClicked(_ sender: Any) {
        loginViewModel.loginUser(email: emailTextField.text ?? "", password: passTextField.text ?? "")
    }
    
}

//MARK: LoginViewModelOutputProtocol
extension LoginViewController: LoginViewModelOutputProtocol {
    func startLoading() {
        loginButton.setTitle("", for: .normal)
        loginButton.isEnabled = false
        loadIndicator.isHidden = false
        loadIndicator.startAnimating()
    }
    
    func stopLoading() {
        loginButton.setTitle("Giriş Yap", for: .normal)
        loginButton.isEnabled = true
        loadIndicator.stopAnimating()
        loadIndicator.isHidden = true
    }
    
    func update(uid: String) {
        print("Giriş Başarılı")
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let homeVC = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        homeVC.homeViewModel.uid = uid
        homeVC.navigationItem.hidesBackButton = true
        navigationController?.pushViewController(homeVC, animated: true)
    }
    
    func error(error: any Error) {
        showAlert(title: "Hata", message: "E-posta veya şifre hatalı. Hata: \(error.localizedDescription)")
    }
}

