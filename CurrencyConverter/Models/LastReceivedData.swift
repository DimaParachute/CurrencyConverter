//
//  LastReceivedData.swift
//  CurrencyConverter
//
//  Created by Дмитрий Фетюхин on 03.03.2022.
//

import Foundation

final class LastReceivedData {
    
    private enum DataKeys: String {
        case USDtoEUR
        case RUBtoEUR
        case dateAndTime
    }
    
    static var USDtoEUR: Double! {
        get {
            return UserDefaults.standard.double(forKey: DataKeys.USDtoEUR.rawValue)
        } set {
            let defaults = UserDefaults.standard
            let key = DataKeys.USDtoEUR.rawValue
            if let USD = newValue {
                defaults.set(USD, forKey: key)
            } else {
                defaults.removeObject(forKey: key)
            }
        }
    }
    
    static var RUBtoEUR: Double! {
        get {
            return UserDefaults.standard.double(forKey: DataKeys.RUBtoEUR.rawValue)
        } set {
            let defaults = UserDefaults.standard
            let key = DataKeys.RUBtoEUR.rawValue
            if let RUB = newValue {
                defaults.set(RUB, forKey: key)
            } else {
                defaults.removeObject(forKey: key)
            }
        }
    }
    
    static var dateAndTime: String! {
        get {
            return UserDefaults.standard.string(forKey: DataKeys.dateAndTime.rawValue)
        } set {
            let defaults = UserDefaults.standard
            let key = DataKeys.dateAndTime.rawValue
            if let dateAndTime = newValue {
                defaults.set(dateAndTime, forKey: key)
            } else {
                defaults.removeObject(forKey: key)
            }
        }
    }
}
