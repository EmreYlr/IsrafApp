//
//  PaymentViewController.swift
//  IsrafApp
//
//  Created by Emre on 18.08.2024.
//

import UIKit

final class PaymentViewController: UIViewController {
    //MARK: -Variables
    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var cardNumberLabel: UITextField!
    @IBOutlet weak var ccvLabel: UITextField!
    @IBOutlet weak var oldPriceLabel: UILabel!
    @IBOutlet weak var newPriceLabel: UILabel!
    
    @IBOutlet weak var yearLabel: UITextField!
    @IBOutlet weak var monthLabel: UITextField!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var totalView: UIView!
    @IBOutlet weak var payButton: UIButton!

    var paymentViewModel: PaymentViewModelProtocol = PaymentViewModel()
    
    //MARK: -FUNCTIONS
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Payment Screen")
        startSetting()
    }
    func startSetting() {
        guard let food = paymentViewModel.food else {
            showAlert(title: "Hata", message: "Ödeme bilgileri alınamadı.")
            return
        }
        oldPriceLabel.textColor = UIColor(named: "CutColor")
        let attributedString = NSMutableAttributedString(string: food.oldPrice)
        attributedString.addAttribute(.strikethroughStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 0, length: attributedString.length))
        oldPriceLabel.attributedText = attributedString
        newPriceLabel.text = food.newPrice
        totalLabel.text = food.newPrice
        totalView.layer.cornerRadius = 18
        payButton.layer.cornerRadius = 8
    }
    
    @IBAction func payButtonClicked(_ sender: Any) {
        let alertController = UIAlertController(title: "Uyarı", message: "Ödeme işlemi yapılıyor. Emin misiniz?", preferredStyle: .alert)

        let yesAction = UIAlertAction(title: "Evet", style: UIAlertAction.Style.default) {
                UIAlertAction in
            self.showAlert(title: "Başarılı", message: "Ödeme işlemi başarılı bir şekilde gerçekleştirildi.")
            if let homeViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController {
            self.navigationController?.setViewControllers([homeViewController], animated: true)
            }
            
        }
        let cancelAction = UIAlertAction(title: "İptal", style: UIAlertAction.Style.cancel) {
                UIAlertAction in
            self.showAlert(title: "İptal", message: "Ödeme işlemi iptal edildi.")
            }
            alertController.addAction(yesAction)
            alertController.addAction(cancelAction)
        self.present(alertController, animated: true)
    }
    
    
}
