//
//  ErrorView.swift
//  SearchApp
//
//  Created by Daniil Dorofieiev on 12.09.22.
//

import SwiftUI

enum StateViewType {
    case error
    case empty
}

private struct StateViewConfiguration {
    let imageName: String
    let text: String
    let accessibilityId: String
    
    init(with type: StateViewType) {
        switch type {
        case .error:
            imageName = "exclamationmark.triangle"
            text = "Something went wrong"
            accessibilityId = AccessibilityIdentifiers.Views.errorView.rawValue
        case .empty:
            imageName = "cart"
            text = "No results"
            accessibilityId = AccessibilityIdentifiers.Views.emptyView.rawValue
        }
    }
}

struct StateView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    private let configuration: StateViewConfiguration
    
    init(type: StateViewType) {
        configuration = StateViewConfiguration(with: type)
    }
    
    var body: some View {
        VStack(spacing: 15) {
            Image(systemName: configuration.imageName)
                .resizable()
                .frame(width: 48, height: 48)
            
            Text(configuration.text)
                .font(.caption)
        }
        .accessibilityIdentifier(configuration.accessibilityId)
        .frame(width: 200, height: 200)
        .background(Color.systemBackground)
    }
}

struct StateView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            StateView(type: .empty)
            StateView(type: .error)
        }
    }
}
