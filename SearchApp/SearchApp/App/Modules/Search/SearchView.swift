//
//  ContentView.swift
//  SearchApp
//
//  Created by Daniil Dorofieiev on 12.09.22.
//

import Foundation
import SwiftUI

struct SearchView<VM: SearchViewModelProtocol>: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    @ObservedObject var viewModel: VM
    @State private var searchText = ""
            
    var body: some View {
        NavigationView {
            GeometryReader { geometryReader in
                ScrollView {
                    LazyVStack(alignment: .center, spacing: 20) {
                        if let products = viewModel.products, !products.isEmpty {
                            ForEach(products, id: \.productId) { product in
                                ProductItemView(with: product)
                                    .frame(width: geometryReader.size.width, height: 280)
                            }
                        }
                    }
                }
            }
            .emptyPlaceholder(viewModel.products) {
                ErrorView(imageName: "cart", text: "No results")
                    .padding(.top, 20)
            }
            .errorPlaceholder(viewModel.showError) {
                ErrorView(imageName: "exclamationmark.triangle", text: "Something went wrong")
                    .padding(.top, 20)
            }
        }
        .searchable(text: $searchText)
        .navigationTitle("Products")
        .onChange(of: searchText) { newQuery in
            viewModel.searchBy(query: searchText)
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(viewModel: SearchViewModelMock())
    }
}
