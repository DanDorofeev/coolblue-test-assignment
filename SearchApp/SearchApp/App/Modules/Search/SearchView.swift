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
    
    private let columns = [GridItem(.adaptive(minimum: 80))]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(viewModel.products, id: \.productId) { product in
                    if let name = product.productName {
                        Text(name)
                    }
                }
            }.emptyPlaceholder(viewModel.products) {
                ErrorView(imageName: "cart", text: "No results")
                    .padding(.top, 20)
            }
            .errorPlaceholder(viewModel.showError) {
                ErrorView(imageName: "exclamationmark.triangle", text: "Something went wrong")
                    .padding(.top, 20)
            }            
        }.onAppear {
            viewModel.searchBy(query: nil)
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(viewModel: SearchViewModelMock())
    }
}
