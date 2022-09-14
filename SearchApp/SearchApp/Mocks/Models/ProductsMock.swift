//
//  ProductsMock.swift
//  SearchApp
//
//  Created by Daniil Dorofieiev on 12.09.22.
//

import Foundation

#if DEBUG
extension Products {
    static var example: Products {
        Products(data: [Product.example1, Product.example2], currentPage: 1, pageSize: 1, totalResults: 1, pageCount: 1)
    }
}

extension Product {
    static var example1: Product {
        Product(productId: 785359,
                productName: "Apple iPhone 6 32GB Grijs",
                reviewInformation: ReviewInformation.example1,
                usps: ["32 GB opslagcapaciteit", "4,7 inch Retina HD scherm", "iOS 11"],
                availabilityState: 2,
                salesPriceIncVat: 369,
                productImage: "https://image.coolblue.nl/300x750/products/818870",
                coolbluesChoiceInformationTitle: "middenklasse iPhone",
                promoIcon: PromoIcon.example1,
                nextDayDelivery: true)
    }
    
    static var example2: Product {
        Product(productId: 793277,
                productName: "Apple iPhone X 64GB Space Gray",
                reviewInformation: ReviewInformation.example2,
                usps: ["64 GB opslagcapaciteit", "5,8 inch Retina HD scherm", "iOS 11"],
                availabilityState: 2,
                salesPriceIncVat: 1079,
                productImage: "https://image.coolblue.nl/300x750/products/982902",
                coolbluesChoiceInformationTitle: "een topklasse iPhone",
                promoIcon: PromoIcon.example2,
                nextDayDelivery: true)
    }
    
    static var example3: Product {
        Product(productId: 738620,
                productName: "Apple iPhone 7 32GB Zwart",
                reviewInformation: ReviewInformation.example1,
                usps: nil,
                availabilityState: 2,
                salesPriceIncVat: 575,
                productImage: nil,
                coolbluesChoiceInformationTitle: nil,
                promoIcon: PromoIcon.example1,
                nextDayDelivery: true)
    }
}
#endif
