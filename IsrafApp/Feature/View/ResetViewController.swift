//
//  ResetViewController.swift
//  IsrafApp
//
//  Created by Emre on 20.08.2024.
//

import UIKit

final class ResetViewController: UIViewController {
    //MARK: -Variables
    @IBOutlet weak var emailLabel: UITextField!
    @IBOutlet weak var resetButton: UIButton!
    var resetViewModel: ResetViewModelProtocol = ResetViewModel()
    //MARK: -FUNCTION
    override func viewDidLoad() {
        super.viewDidLoad()
        resetViewModel.delegate = self
        resetButton.layer.cornerRadius = 8
    }
    
    @IBAction func resetButtonClicked(_ sender: Any) {
        guard let email = emailLabel.text else { return }
        resetViewModel.resetPassword(email: email)
    }
}
extension ResetViewController: ResetViewModelOutputProtocol {
    func success() {
        showAlert(title: "Başarılı", message: "Şifre sıfırlama e-postası başarıyla gönderildi.")
        navigationController?.popViewController(animated: true)
    }
    
    func error(error: Error) {
        showAlert(title: "Hata", message: "Şifre sıfırlama e-postası gönderilemedi: \(error.localizedDescription)")
    }
}
