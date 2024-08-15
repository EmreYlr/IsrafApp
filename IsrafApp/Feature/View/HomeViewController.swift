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
    
    var homeViewModel: HomeViewModelProtocol = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        homeViewModel.delegate = self
        tableView.register(UINib(nibName: "OrderTableViewCell", bundle: nil), forCellReuseIdentifier: "Cell")
        homeViewModel.fetchFoods()
    }
    

}
extension HomeViewController: HomeViewModelOutputProtocol {
    func update() {
        tableView.reloadData()
    }
    
    func error() {
        print("error")
    }
    
        
}
