//
//  HomeViewController.swift
//  IsrafApp
//
//  Created by Emre on 8.08.2024.
//

import UIKit

final class HomeViewController: UIViewController {
    //MARK: -Variables
    var homeViewModel: HomeViewModelProtocol = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(homeViewModel.uid)
    }
    

}
