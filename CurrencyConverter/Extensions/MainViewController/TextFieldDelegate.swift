//
//  TextFieldDelegate.swift
//  CurrencyConverter
//
//  Created by Дмитрий Фетюхин on 25.02.2022.
//

import UIKit

extension MainViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let char = string.cString(using: String.Encoding.utf8)!
        let isBackSpace = strcmp(char, "\\b")
        var inputNumber = "\(textField.text!)\(string)"
        if (isBackSpace == -92) {
            print("Backspace was pressed")
            inputNumber.remove(at: inputNumber.index(before: inputNumber.endIndex))
        }
        configureLabels(baseNumberOfEUR: Double(inputNumber) ?? 1.0)
        return true
    }
}
