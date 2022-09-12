//
//  SearchAppApp.swift
//  SearchApp
//
//  Created by Daniil Dorofieiev on 12.09.22.
//

import SwiftUI

@main
struct SearchApp: App {
    var body: some Scene {
        WindowGroup {
            SearchView(viewModel: SearchViewModel(apiClient: CoolBlueAPIClient()))
        }
    }
}
