//
//  Header.swift
//  Netclan Explorer
//
//  Created by Tamuna Kakhidze on 17.08.24.
//

import SwiftUI

// MARK: - Header

struct Header: View {
    
    // MARK: - Properties

    var pageName: String
    var location: String
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill()
                .frame(height: 120)
                .foregroundStyle(.primaryBlue)
            
            HStack {
                Image(.hamburgerMenuIcon)
                    .resizable()
                    .foregroundStyle(.white)
                    .frame(width: 65, height: 50)
                
                Spacer()
                    .frame(width: 10)
                
                VStack(alignment: .leading) {
                    Text(pageName)
                        .foregroundStyle(.white)
                        .bold()
                    
                    HStack {
                        Image(.pin)
                            .resizable()
                            .frame(width: 20, height: 25)
                        
                        Text(location)
                            .foregroundStyle(.white)
                    }
                }
                
                Spacer()
                
                Image(systemName: "bell")
                    .resizable()
                    .renderingMode(.template)
                    .foregroundStyle(.white)
                    .frame(width: 30, height: 35)
                    .padding()
                
            }
        }
    }
}

#Preview {
    ExploreView()
}
