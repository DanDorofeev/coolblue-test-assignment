//
//  SearchViewModel.swift
//  SearchApp
//
//  Created by Daniil Dorofieiev on 12.09.22.
//

import Foundation
import Combine

protocol SearchViewModelProtocol: ObservableObject {
    var products: [Product]? {get}
    var showError: Bool {get}
    func searchBy(query: String)
}

final class SearchViewModel: SearchViewModelProtocol {
    
    @Published private(set) var isLoading = false
    @Published private(set) var products: [Product]?
    @Published private(set) var showError = false
    
    private let apiClient: CoolBlueAPIClientProtocol
    private var cancellable: AnyCancellable?
    
    init(apiClient: CoolBlueAPIClientProtocol = CoolBlueAPIClient()) {
        self.apiClient = apiClient
    }
    
    func searchBy(query: String) {
        guard !query.isEmpty else {
            products = nil
            return
        }
        isLoading = true
        cancellable = apiClient.searchBy(query: query, page: 1)
            .sink { [weak self] completion in
                switch completion {
                case .failure(let error):
                    debugPrint(error.localizedDescription)
                    self?.showError = true
                case .finished: break
                }
            } receiveValue: { [weak self] result in
                self?.products = result.data
            }
    }
}
