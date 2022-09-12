//
//  Products.swift
//  SearchApp
//
//  Created by Daniil Dorofieiev on 12.09.22.
//

import Foundation

struct Products: Codable {
    let data: [Product]
    let currentPage: Int
    let pageSize: Int
    let totalResults: Int
    let pageCount: Int
    
    enum CodingKeys: String, CodingKey {
        case data = "products"
        case currentPage, pageSize, totalResults, pageCount
    }
}

struct Product: Codable {
    let productId: Int
    let productName: String?
    let reviewInformation: ReviewInformation?
    let usps: [String]?
    let availabilityState: Int?
    let salesPriceIncVat: Double?
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
