//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Дмитрий Фетюхин on 18.02.2022.
//

import UIKit

final class MainViewController: UIViewController {
    
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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
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
        self.firstConvertResultLabel.text = currency.convert(baseNumber: baseNumberOfEUR, currency: currency.USDtoEUR)
        self.secondConvertResultLabel.text = currency.convert(baseNumber: baseNumberOfEUR, currency: currency.RUBtoEUR)
    }
    
    // MARK: - IBActions
    
    @IBAction func actionButtonTapped(_ sender: UIBarButtonItem) {
        let dataForSharing = ["At the moment \(currency.baseNumber) euros = \(currency.convert(baseNumber: currency.baseNumber, currency: currency.USDtoEUR)) dollars or \(currency.convert(baseNumber: currency.baseNumber, currency: currency.RUBtoEUR)) rubles"]
        let shareController = UIActivityViewController(activityItems: dataForSharing, applicationActivities: nil)
        shareController.popoverPresentationController?.barButtonItem = sender
        shareController.popoverPresentationController?.permittedArrowDirections = .any
        present(shareController, animated: true, completion: nil)
    }
}

extension MainViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let char = string.cString(using: String.Encoding.utf8)!
        let isBackSpace = strcmp(char, "\\b")
        var inputNumber = "\(textField.text!)\(string)"
        if (isBackSpace == -92) {
            print("Backspace was pressed")
            inputNumber.remove(at: inputNumber.index(before: inputNumber.endIndex))
        }
        currency.baseNumber = Double(inputNumber) ?? 0.0
        configureLabels(baseNumberOfEUR: Double(inputNumber) ?? 1.0)
        return true
    }
}
