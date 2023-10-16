//
//  ConversorData.swift
//  CurrencyConversor
//
//  Created by Leidy Luna on 29/08/23.
//

import Foundation

struct ConversorData: Codable {
    let base: String
    let rates: Rates
}

struct Rates: Codable {
    let usd: Double
    let aud: Double
    let cad: Double
    let pln: Double
    let mxn: Double
    
    enum CodingKeys: String, CodingKey {
        case usd = "USD"
        case aud = "AUD"
        case cad = "CAD"
        case pln = "PLN"
        case mxn = "MXN"
        
    }
}

