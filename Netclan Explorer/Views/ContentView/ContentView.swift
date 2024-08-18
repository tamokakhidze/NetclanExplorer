//
//  ContentView.swift
//  Netclan Explorer
//
//  Created by Tamuna Kakhidze on 16.08.24.
//

import SwiftUI

// MARK: - ContentView

struct ContentView: View {
    
    // MARK: - Body

    var body: some View {
        TabView {
            RefineView()
                .tabItem {
                     VStack {
                         Image(systemName: "pencil.line")
                             .renderingMode(.template)
                        Text("Refine")
                    }
                }
            
            ExploreView()
                .tabItem {
                     VStack {
                         Image(systemName: "eye.fill")
                             .renderingMode(.template)
                        Text("Explore")
                    }
                }
        }
        .shadow(radius: 10)
    }
}

#Preview {
    ContentView()
}
