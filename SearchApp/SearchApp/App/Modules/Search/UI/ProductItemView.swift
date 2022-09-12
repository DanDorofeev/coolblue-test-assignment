//
//  ProductItemView.swift
//  SearchApp
//
//  Created by Daniil Dorofieiev on 12.09.22.
//

import SwiftUI

struct ProductItemView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    private let product: Product
    
    init(with product: Product) {
        self.product = product
    }
    
    var body: some View {
        VStack {
            if let imageString = product.productImage, let url = URL(string: imageString) {
                mainImageWidth(url: url)
                    .frame(height: 140)
            }
            
            if let productName = product.productName {
                Text(productName)
                    .font(.title3)
                    .foregroundColor(Color.label)
            }
                
        }
    }
    
    // MARK: - Private
    
    @ViewBuilder private func mainImageWidth(url: URL) -> some View {
        AsyncImage(url: url, content: { image in
             image
                 .resizable()
                 .scaledToFit()
                 .frame(height: 140, alignment: .center)
                 .background(Color.blue)
        }, placeholder: {
            ProgressView()
        })
    }
}

struct ProductItemView_Previews: PreviewProvider {
    static var previews: some View {
        ProductItemView(with: Product.example1)
            .previewLayout(.fixed(width: 375, height: 280))
    }
}
