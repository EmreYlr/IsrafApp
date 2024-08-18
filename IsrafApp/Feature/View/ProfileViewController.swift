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
    var profileViewModel: ProfileViewModelProtocol = ProfileViewModel()
    //MARK: -FUNCTION
    override func viewDidLoad() {
        super.viewDidLoad()
        profileViewModel.delegate = self
    }
    
    @IBAction func logoutButtonClicked(_ sender: Any) {
        profileViewModel.singoutUser()
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
