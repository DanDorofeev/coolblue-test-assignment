//
//  ContentView.swift
//  SearchApp
//
//  Created by Daniil Dorofieiev on 12.09.22.
//

import Foundation
import SwiftUI

struct SearchView<VM: SearchViewModelProtocol>: View {
    
    @ObservedObject var viewModel: VM
    
    var body: some View {
        HStack {
            
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
