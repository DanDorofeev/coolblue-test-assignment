//
//  ProductItemView.swift
//  SearchApp
//
//  Created by Daniil Dorofieiev on 12.09.22.
//

import SwiftUI

struct ProductItemView: View {
    
    private let product: Product
    
    init(with product: Product) {
        self.product = product
    }
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct ProductItemView_Previews: PreviewProvider {
    static var previews: some View {
        ProductItemView(with: Product.example1)
    }
}
