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
    
    //MARK: -FUNCTIONS
    override func viewDidLoad() {
        super.viewDidLoad()
        registerButtonSettings()
        print("Register")
    }
    func registerButtonSettings() {
        registerButton.layer.cornerRadius = 8
    }
    
    @IBAction func registerButtonClicked(_ sender: Any) {
        
    }
}
