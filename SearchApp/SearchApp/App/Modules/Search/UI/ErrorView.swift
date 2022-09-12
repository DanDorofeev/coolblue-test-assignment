//
//  ErrorView.swift
//  SearchApp
//
//  Created by Daniil Dorofieiev on 12.09.22.
//

import SwiftUI

struct ErrorView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    private let imageName: String
    private let text: String
    
    init(imageName: String, text: String) {
        self.imageName = imageName
        self.text = text
    }
    
    var body: some View {
        VStack(spacing: 15) {
            Image(systemName: imageName)
                .resizable()
                .frame(width: 48, height: 48)
            
            Text(text)
                .font(.caption)
        }
        .background(Color.systemBackground)
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(imageName: "heart", text: "test text")
    }
}
