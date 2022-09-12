//
//  EmptyPlaceholderModifier.swift
//  SearchApp
//
//  Created by Daniil Dorofieiev on 12.09.22.
//

import Foundation
import SwiftUI

struct EmptyPlaceholderModifier<Items: Collection>: ViewModifier {
    let items: Items
    let placeholder: AnyView

    @ViewBuilder func body(content: Content) -> some View {
        if !items.isEmpty {
            content
        } else {
            placeholder
        }
    }
}

struct ErrorPlaceholderModifier: ViewModifier {
    let shouldDisplayPlaceholder: Bool
    let placeholder: AnyView

    @ViewBuilder func body(content: Content) -> some View {
        if !shouldDisplayPlaceholder {
            content
        } else {
            placeholder
        }
    }
}

extension View {
    func emptyPlaceholder<Items: Collection, PlaceholderView: View>(_ items: Items, _ placeholder: @escaping () -> PlaceholderView) -> some View {
        modifier(EmptyPlaceholderModifier(items: items, placeholder: AnyView(placeholder())))
    }
    
    func errorPlaceholder<PlaceholderView: View>(_ shouldDisplayPlaceholder: Bool, _ placeholder: @escaping () -> PlaceholderView) -> some View {
        modifier(ErrorPlaceholderModifier(shouldDisplayPlaceholder: shouldDisplayPlaceholder, placeholder: AnyView(placeholder())))
    }
}
