//
//  ConversorData.swift
//  CurrencyConversor
//
//  Created by Leidy Luna on 29/08/23.
//

import Foundation

struct ConversorData: Codable {
    let base: String
    let rates: rates
}

struct rates: Codable {
    let USD: Double
    let AUD: Double
    let CAD: Double
    let PLN: Double
    let MXN: Double
}

