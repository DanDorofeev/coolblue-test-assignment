//
//  ProductDetailsView.swift
//  SearchApp
//
//  Created by Daniil Dorofieiev on 12.09.22.
//

import SwiftUI

struct ProductDetailsView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    private let product: Product?
    private let imageHeight: CGFloat = 320
    
    init(with product: Product?) {
        self.product = product
    }
    
    var body: some View {
        GeometryReader { geometryReader in
            ScrollView(showsIndicators: false) {
                VStack(alignment: .center, spacing: 20) {
                    VStack(spacing: 40) {
                        VStack(spacing: 20) {
                            if let url = product?.getImageURL() {
                                mainImage(url: url, viewWidth: geometryReader.size.width)
                            }
                        }
                                                   
                    }
                }
            }
        }
    }
    
    // MARK: - Private
    
    @ViewBuilder private func mainImage(url: URL, viewWidth: CGFloat) -> some View {
        AsyncImage(url: url, content: { image in
             image
                 .resizable()
                 .scaledToFit()
                 .frame(width: viewWidth, height: imageHeight, alignment: .center)
        }, placeholder: {
            ProgressView()
        })
    }
}

struct ProductDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailsView(with: Product.example1)
    }
}
