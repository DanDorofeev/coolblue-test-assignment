//
//  ErrorView.swift
//  SearchApp
//
//  Created by Daniil Dorofieiev on 12.09.22.
//

import SwiftUI

struct StateView: View {
    
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
        .frame(width: 200, height: 200)
        .background(Color.systemBackground)
    }
}

struct StateView_Previews: PreviewProvider {
    static var previews: some View {
        StateView(imageName: "heart", text: "test text")
    }
}
