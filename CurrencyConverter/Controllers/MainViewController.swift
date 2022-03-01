//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Дмитрий Фетюхин on 18.02.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - OBOutlets
    
    @IBOutlet weak var currencyView: UIView!
    @IBOutlet weak var baseCurrencyTextField: UITextField!
    @IBOutlet weak var firstConvertResultLabel: UILabel!
    @IBOutlet weak var secondConvertResultLabel: UILabel!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    
    private var currency = Currency.sharedInstance()
    private var networkWorker = NetworkWorker()
    
    // MARK: - ViewController lifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.baseCurrencyTextField.delegate = self
        configureCurrencyView()
        networkWorker.updateCurrencyInfo(completion: configureLabels)
    }
    
    // MARK: - methods
    
    private func configureCurrencyView() {
        currencyView.backgroundColor = Styles.currencyViewColor
        currencyView.layer.cornerRadius = Styles.currencyViewCornerRadius
        currencyView.layer.shadowColor = Styles.shadowColor
        currencyView.layer.shadowOpacity = Styles.shadowOpacity
        currencyView.layer.shadowOffset = Styles.shadowOffset
        currencyView.layer.shadowRadius = Styles.shadowRadius
    }
    
    func configureLabels(baseNumberOfEUR: Double) {
        self.activityIndicatorView.isHidden = true
        self.firstConvertResultLabel.text = String(baseNumberOfEUR * currency.USDtoEUR)
        self.secondConvertResultLabel.text = String(baseNumberOfEUR * currency.RUBtoEUR)
    }
}
