//
//  Products.swift
//  SearchApp
//
//  Created by Daniil Dorofieiev on 12.09.22.
//

import Foundation

struct Products: Codable {
    let data: [Product]
    
    enum CodingKeys: String, CodingKey {
        case data = "products"
    }
}

struct Product: Codable {
    let productId: Int
    let productName: String?
    let reviewInformation: ReviewInformation?
    let usps: [String]?
    let availabilityState: Int?
    let salesPriceIncVat: Int?
    let productImage: String?
    let coolbluesChoiceInformationTitle: String?
    let promoIcon: PromoIcon?
    let nextDayDelivery: Bool
    
    enum CodingKeys: String, CodingKey {
        case usps = "USPs"
        case productId, productName, reviewInformation, availabilityState,
             salesPriceIncVat, productImage, coolbluesChoiceInformationTitle,
             promoIcon, nextDayDelivery
    }
}
