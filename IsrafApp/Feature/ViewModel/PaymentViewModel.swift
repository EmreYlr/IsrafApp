//
//  PaymentViewModel.swift
//  IsrafApp
//
//  Created by Emre on 18.08.2024.
//

import Foundation

protocol PaymentViewModelProtocol {
    var delegate: PaymentViewModelOutputProtocol? { get set }
    var food: Food? { get set }
}

protocol PaymentViewModelOutputProtocol: AnyObject {
    func success()
    func error()
}

final class PaymentViewModel {
    weak var delegate: PaymentViewModelOutputProtocol?
    var food: Food?
}

extension PaymentViewModel: PaymentViewModelProtocol {}

