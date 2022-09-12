//
//  SearchViewModel.swift
//  SearchApp
//
//  Created by Daniil Dorofieiev on 12.09.22.
//

import Foundation
import Combine

protocol SearchViewModelProtocol: ObservableObject {
    func searchBy(query: String?)
}

final class SearchViewModel: SearchViewModelProtocol {
    
    @Published private(set) var isLoading = false
    @Published private(set) var products: [Product]?
    
    private let apiClient: CoolBlueAPIClientProtocol
    private var cancellable: AnyCancellable?
    
    init(apiClient: CoolBlueAPIClientProtocol) {
        self.apiClient = apiClient
    }
    
    func searchBy(query: String?) {
        isLoading = true
        cancellable = apiClient.searchBy(query: "apple", page: 1)
            .sink(receiveCompletion: { _ in },
                  receiveValue: {[weak self] in
                    self?.isLoading = false
                    self?.products = $0.data
            })
    }
}
