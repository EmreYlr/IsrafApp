//
//  HomeViewController.swift
//  IsrafApp
//
//  Created by Emre on 8.08.2024.
//

import UIKit

final class HomeViewController: UIViewController {
    //MARK: -Variables
    @IBOutlet weak var tableView: UITableView!
    
    var homeViewModel: HomeViewModelProtocol
    
    init(viewModel: HomeViewModelProtocol) {
        self.homeViewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        self.homeViewModel = HomeViewModel()
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        homeViewModel.delegate = self
        tableView.register(UINib(nibName: "OrderTableViewCell", bundle: nil), forCellReuseIdentifier: "Cell")
    }
    

}
extension HomeViewController: HomeViewModelOutputProtocol {
        
}
