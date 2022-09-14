//
//  View+Extensions.swift
//  SearchApp
//
//  Created by Daniil Dorofieiev on 13.09.22.
//

import SwiftUI

public extension View {
    @ViewBuilder func `if`<Content: View>(_ condition: @autoclosure () -> Bool, transform: (Self) -> Content) -> some View {
        if condition() {
            transform(self)
        } else {
            self
        }
    }
        
    @ViewBuilder func iflet<Content: View, T>(_ conditional: T?, @ViewBuilder _ content: (Self, _ value: T) -> Content) -> some View {
        if let value = conditional {
            content(self, value)
        } else {
            self
        }
    }
    
    func printUI(_ vars: Any...) -> some View {
        for v in vars { debugPrint(v) }
        return EmptyView()
    }
}
