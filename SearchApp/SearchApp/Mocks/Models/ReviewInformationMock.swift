//
//  ReviewInformationMock.swift
//  SearchApp
//
//  Created by Daniil Dorofieiev on 12.09.22.
//

import Foundation

#if DEBUG
extension ReviewInformation {
    static var example1: ReviewInformation {
        ReviewInformation(reviews: [],
                          reviewSummary: ReviewSummary(reviewAverage: 9.1, reviewCount: 952))
    }
    
    static var example2: ReviewInformation {
        ReviewInformation(reviews: [],
                          reviewSummary: ReviewSummary(reviewAverage: 8.7, reviewCount: 1316))
    }
}
#endif
