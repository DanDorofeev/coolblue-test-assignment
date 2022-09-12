//
//  ReviewInformation.swift
//  SearchApp
//
//  Created by Daniil Dorofieiev on 12.09.22.
//

import Foundation

struct ReviewInformation: Codable {
    let reviews: [String]?
    let reviewSummary: ReviewSummary?
}

struct ReviewSummary: Codable {
    let reviewAverage: Double?
    let reviewCount: Int
}
