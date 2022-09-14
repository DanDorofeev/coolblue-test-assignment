//
//  PromoIconMock.swift
//  SearchApp
//
//  Created by Daniil Dorofieiev on 12.09.22.
//

import Foundation

#if DEBUG
extension PromoIcon {
    static var example1: PromoIcon {
        PromoIcon(text: "middenklasse iPhone", type: "coolblues-choice")
    }
    
    static var example2: PromoIcon {
        PromoIcon(text: "een topklasse iPhone", type: "coolblues-choice")
    }
}
#endif
