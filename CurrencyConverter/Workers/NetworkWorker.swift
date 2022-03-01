//
//  NetworkWorker.swift
//  CurrencyConverter
//
//  Created by Дмитрий Фетюхин on 25.02.2022.
//

import Foundation

class NetworkWorker: NSObject {
    
    private var currencyInfo = CurrencyInfo()
    private var currency = Currency.sharedInstance()
    
    func updateCurrencyInfo(completion: ((_: Double) -> Void)? = nil) {
        let session = URLSession.shared
        let url = Constants.urlForCurrency
        let task = session.dataTask(with: url) { (data, response, error) in
            guard error == nil else {
                print("DataTask error: \(error!.localizedDescription)")
                completion?(1.0)
                return
            }
            do {
                self.currencyInfo = try JSONDecoder().decode(CurrencyInfo.self, from: data!)
                DispatchQueue.main.async {
                    print(self.currencyInfo.rates.USD)
                    print(self.currencyInfo.rates.RUB)
                    self.currency.USDtoEUR = self.currencyInfo.rates.USD
                    self.currency.RUBtoEUR = self.currencyInfo.rates.RUB
                    completion?(1.0)
                }
            } catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
}
