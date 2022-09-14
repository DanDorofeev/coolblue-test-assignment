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
    private let imageHeight: CGFloat = 180
    
    init(with product: Product) {
        self.product = product
    }
    
    var body: some View {
        GeometryReader { geometryReader in
            VStack(alignment: .leading) {
                if let url = product.getImageURL() {
                    mainImageWidth(url: url)
                        .frame(width: geometryReader.size.width, height: imageHeight)
                        .background(Color.white)
                        .padding(.top, -8)
                }
                
                productDescription()                    
            }
            .frame(minHeight: 280)
            .background(Color.secondarySystemBackground)
            .cornerRadius(6)
            .shadow(color: Color.black.opacity(0.4), radius: 4)
            
        }
        .padding([.leading, .trailing], 16)
    }
    
    // MARK: - Private
    
    @ViewBuilder private func mainImageWidth(url: URL) -> some View {
        AsyncImage(url: url, content: { image in
             image
                 .resizable()
                 .scaledToFit()
        }, placeholder: {
            ProgressView()
        })
    }
    
    @ViewBuilder private func productDescription() -> some View {
        VStack(alignment: .leading, spacing: 8) {
            if let productName = product.productName {
                Text(productName)
                    .font(.title3)
                    .foregroundColor(Color.label)
                    .fixedSize(horizontal: false, vertical: true)
                    .lineLimit(2)
            }
            
            if let price = product.priceFormattedString() {
                Text(price)
                    .font(.subheadline)
                    .foregroundColor(Color.label)
            }
        }.padding()
    }
}

struct ProductItemView_Previews: PreviewProvider {
    static var previews: some View {
        ProductItemView(with: Product.example1)
            .previewLayout(.fixed(width: 375, height: 280))
    }
}
