//
//  String+Extensions.swift
//  SearchApp
//
//  Created by Daniil Dorofieiev on 13.09.22.
//

import Foundation

extension String {
    func currencyString() -> String? {
        guard let value = Double(self) else {return nil}
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 3
        formatter.minimumFractionDigits = 0
        formatter.numberStyle = .currencyAccounting
        formatter.locale = Locale.current
        formatter.currencyCode = "eur"
        return formatter.string(from: NSNumber(value: value))
    }
}
