//
//  View+Extensions.swift
//  SearchApp
//
//  Created by Daniil Dorofieiev on 13.09.22.
//

import SwiftUI

public extension View {    
    func printUI(_ vars: Any...) -> some View {
        for v in vars { debugPrint(v) }
        return EmptyView()
    }
}
