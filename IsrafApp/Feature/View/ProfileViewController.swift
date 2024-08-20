//
//  ProfileViewController.swift
//  IsrafApp
//
//  Created by Emre on 18.08.2024.
//

import UIKit

final class ProfileViewController: UIViewController {
    //MARK: -Variables
    
    @IBOutlet weak var logoutButton: UIButton!
    
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var lastnameLabel: UILabel!
    
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var lastOrderButton: UIButton!
    
    @IBOutlet weak var deleteAccountLabel: UIButton!
    var profileViewModel: ProfileViewModelProtocol = ProfileViewModel()
    //MARK: -FUNCTION
    override func viewDidLoad() {
        super.viewDidLoad()
        profileViewModel.delegate = self
        profileViewModel.fetchUser()
        if let user = profileViewModel.user {
            nameLabel.text = user.firstName
            lastnameLabel.text = user.lastName
            emailLabel.text = user.email
            welcomeLabel.text = "Hoşgeldiniz, \(user.firstName)"
        }
        logoutButton.layer.cornerRadius = 8
        lastOrderButton.layer.cornerRadius = 8
        deleteAccountLabel.layer.cornerRadius = 8
    }
    
    @IBAction func logoutButtonClicked(_ sender: Any) {
        profileViewModel.singoutUser()
    }
    
    @IBAction func lastOrderButtonClicked(_ sender: Any) {
        showAlert(title: "Uyarı", message: "Tasarım aşamasında")
    }
    
    @IBAction func deleteAccountButtonClicked(_ sender: Any) {
        let alertController = UIAlertController(title: "Uyarı", message: "Hesabınızı silmek istediğinize emin misiniz?", preferredStyle: .alert)
        
        let yesAction = UIAlertAction(title: "Evet", style: UIAlertAction.Style.default) {
            UIAlertAction in
        }
        let cancelAction = UIAlertAction(title: "İptal", style: UIAlertAction.Style.cancel) {
            UIAlertAction in
        }
        alertController.addAction(yesAction)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
}

extension ProfileViewController: ProfileViewModelOutputProtocol {
    func update(){
        if let loginViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController {
            self.tabBarController?.tabBar.isHidden = true
            self.navigationController?.setViewControllers([loginViewController], animated: true)
        }
    }
    
    func error() {
        showAlert(title: "Error", message: "Beklenmeyen bir hata oluştu")
    }
}
