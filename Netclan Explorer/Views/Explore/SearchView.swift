//
//  SearchView.swift
//  Netclan Explorer
//
//  Created by Tamuna Kakhidze on 18.08.24.
//

import SwiftUI

// MARK: - SearchView

struct SearchView: View {
    // MARK: - Properties
    @ObservedObject var viewModel: ExploreViewModel
    
    var body: some View {
        HStack(spacing: 19) {
            
            // MARK: - Textfield with search icon
            HStack {
                
                HStack(alignment: .center) {
                    Image(systemName: "magnifyingglass")
                        .renderingMode(.template)
                        .foregroundStyle(.gray.opacity(0.5))
                        .padding(.leading)
                    
                    TextField("Search", text: $viewModel.searchText)
                        .padding(8)
                        .cornerRadius(8)
                        .padding(.leading, 10)
                }
                .background(Color.gray.opacity(0.1))
                .cornerRadius(50)
                
                Image(.filter)
                    .renderingMode(.template)
                    .foregroundStyle(.gray.opacity(0.5))
                    .padding(.leading)
            }
            
        }
        .padding(.horizontal, 20)
        .frame(height: 30)
    }
}

#Preview {
    ExploreView()
}
