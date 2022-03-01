//
//  DataModels.swift
//  CurrencyConverter
//
//  Created by Дмитрий Фетюхин on 18.02.2022.
//

import Foundation

struct Rates: Codable {
    var USD: Double = 0.0
    var RUB: Double = 0.0
}

class CurrencyInfo: Codable {
    var rates: Rates = Rates()
}
