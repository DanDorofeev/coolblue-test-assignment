//
//  Products.swift
//  SearchApp
//
//  Created by Daniil Dorofieiev on 12.09.22.
//

import Foundation

struct ProductsPage: Codable {
    let products: [Product]
    let currentPage: Int
    let pageSize: Int
    let totalResults: Int
    let pageCount: Int
}

struct Product: Codable {
    let productId: Int
    let productName: String?
    let reviewInformation: ReviewInformation?
    let usps: [String]?
    let availabilityState: Int?
    let salesPriceIncVat: Double?
    let productImage: URL?
    let coolbluesChoiceInformationTitle: String?
    let promoIcon: PromoIcon?
    let nextDayDelivery: Bool
    
    enum CodingKeys: String, CodingKey {
        case usps = "USPs"
        case productId, productName, reviewInformation, availabilityState,
             salesPriceIncVat, productImage, coolbluesChoiceInformationTitle,
             promoIcon, nextDayDelivery
    }
    
    func priceFormattedString() -> String? {
        guard let price = salesPriceIncVat else {
            return nil
        }
        return String(price).currencyString()
    }
}

// MARK: - Hashable

extension Product: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(productId)
    }
        
    static func == (lhs: Product, rhs: Product) -> Bool {
        return lhs.productId == rhs.productId
    }
}
