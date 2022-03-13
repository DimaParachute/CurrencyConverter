//
//  Currency.swift
//  CurrencyConverter
//
//  Created by Дмитрий Фетюхин on 25.02.2022.
//

import Foundation

class Currency {
    static var _sharedInstance: Currency?
    class func sharedInstance() -> Currency {
        if _sharedInstance == nil {
            _sharedInstance = Currency()
        }
        return _sharedInstance!
    }
    
    lazy var dateAndTime = ""
    
    lazy var baseNumber = 0.0
    lazy var USDtoEUR = 0.0
    lazy var RUBtoEUR = 0.0
    
    func convert(baseNumber: Double, currency: Double) -> String {
        return String(baseNumber * currency)
    }
}
