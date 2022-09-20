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
    @State var isLinkActive = false
    @State var selectedItem: Product? = nil
    private let listItemHeight: CGFloat = 280
            
    var body: some View {
        NavigationView {
            GeometryReader { geometryReader in
                ScrollView(showsIndicators: false) {
                    LazyVStack(alignment: .center, spacing: 20) {
                        if let products = viewModel.products, !products.isEmpty {
                            ForEach(products, id: \.productId) { product in
                                viewFor(product: product, withWidth: geometryReader.size.width)
                                .onAppear(perform: {
                                    viewModel.loadMoreContentIfNeeded(currentProduct: product)
                                })
                            }
                        }
                    }
                    .background(
                        NavigationLink(destination: ProductDetailsView(with: selectedItem), isActive: $isLinkActive){
                            EmptyView()
                        }
                     )
                }
            }
            .emptyPlaceholder(viewModel.products) {
                StateView(type: .empty)
                    .padding(.top, 20)
            }
            .errorPlaceholder(viewModel.showError) {
                StateView(type: .error)
                    .padding(.top, 20)
            }
            .navigationBarTitle("Products")
            .navigationBarTitleDisplayMode(.inline)
            .searchable(text: $viewModel.searchQuery)
            .onChange(of: viewModel.searchQuery) { newQuery in
                viewModel.searchBy(query: newQuery)
            }
        }
    }
    
    // MARK: - Private
    
    @ViewBuilder private func viewFor(product: Product, withWidth width: CGFloat) -> some View {
        Button {
            selectedItem = product
            isLinkActive.toggle()
        } label: {
            ProductItemView(with: product)
                .frame(width: width, height: listItemHeight)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(viewModel: SearchViewModelMock())
    }
}
