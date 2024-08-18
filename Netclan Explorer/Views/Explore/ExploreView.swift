//
//  ExploreView.swift
//  Netclan Explorer
//
//  Created by Tamuna Kakhidze on 17.08.24.
//

import SwiftUI

// MARK: - ExploreView
//
//struct ExploreView: View {
//    
//    // MARK: - Properties
//
//    @State private var selectedSegment: Segment = .personal
//    @StateObject private var viewModel = ExploreViewModel()
//    
//    // MARK: - Body
//
//    var body: some View {
//        NavigationView {
//            VStack(spacing: 0) {
//                Header(pageName: "Explore", location: "Tbilisi, Georgia")
//                    .edgesIgnoringSafeArea(.top)
//
//                HStack {
//                    VStack {
//                        Button("Personal") {
//                            selectedSegment = .personal
//                        }
//                        .foregroundStyle(selectedSegment == .personal ? .white : .gray.opacity(0.8))
//                        .bold()
//                        
//                        Rectangle()
//                            .frame(height: 2.5)
//                            .foregroundStyle(selectedSegment == .personal ? .white : .clear)
//                    }
//                    
//                    Spacer()
//                    
//                    VStack {
//                        Button("Professional") {
//                            selectedSegment = .professional
//                        }
//                        .foregroundStyle(selectedSegment == .professional ? .white : .gray.opacity(0.8))
//                        .bold()
//                        
//                        Rectangle()
//                            .frame(height: 2.5)
//                            .foregroundStyle(selectedSegment == .professional ? .white : .clear)
//                    }
//                    Spacer()
//                    
//                    VStack {
//                        Button("Merchant") {
//                            selectedSegment = .merchant
//                        }
//                        .foregroundStyle(selectedSegment == .merchant ? .white : .gray.opacity(0.8))
//                        .bold()
//                        
//                        Rectangle()
//                            .frame(height: 2.5)
//                            .foregroundStyle(selectedSegment == .merchant ? .white : .clear)
//                        
//                    }
//                }
//                .frame(maxWidth: .greatestFiniteMagnitude, maxHeight: 40)
//                .background(Color.primaryBlue)
//                
//                SearchView(viewModel: viewModel)
//                    .padding(.top)
//                    .padding(.bottom)
//                
//                List {
//                    let filteredUsers = viewModel.filteredUsers.filter { user in
//                        user.usertype == selectedSegment
//                    }
//                    ForEach(filteredUsers) { user in
//                        UserCard(user: user, usertype: user.usertype)
//                    }
//                }
//                .listStyle(PlainListStyle())
//                .padding()
//                
//                Spacer()
//            }.onAppear {
//                viewModel.viewAppeared()
//            }
//            
//        }
//    }
//}
//
enum Segment: String, Decodable {
    case personal, professional, merchant
}
//
//#Preview {
//    ExploreView()
//}
struct ExploreView: View {
    
    // MARK: - Properties

    @State private var selectedSegment: Segment = .personal
    @StateObject private var viewModel = ExploreViewModel()
    
    // MARK: - Body

    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                Header(pageName: "Explore", location: "Tbilisi, Georgia")
                
                HStack {
                    VStack {
                        Button("Personal") {
                            selectedSegment = .personal
                        }
                        .foregroundStyle(selectedSegment == .personal ? .white : .gray.opacity(0.8))
                        .bold()
                        
                        Rectangle()
                            .frame(height: 2.5)
                            .foregroundStyle(selectedSegment == .personal ? .white : .clear)
                    }
                    
                    Spacer()
                    
                    VStack {
                        Button("Professional") {
                            selectedSegment = .professional
                        }
                        .foregroundStyle(selectedSegment == .professional ? .white : .gray.opacity(0.8))
                        .bold()
                        
                        Rectangle()
                            .frame(height: 2.5)
                            .foregroundStyle(selectedSegment == .professional ? .white : .clear)
                    }
                    Spacer()
                    
                    VStack {
                        Button("Merchant") {
                            selectedSegment = .merchant
                        }
                        .foregroundStyle(selectedSegment == .merchant ? .white : .gray.opacity(0.8))
                        .bold()
                        
                        Rectangle()
                            .frame(height: 2.5)
                            .foregroundStyle(selectedSegment == .merchant ? .white : .clear)
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: 40)
                .background(Color.primaryBlue)
                
                SearchView(viewModel: viewModel)
                    .padding(.top)
                    .padding(.bottom)
                
                List {
                    let filteredUsers = viewModel.filteredUsers.filter { user in
                        user.usertype == selectedSegment
                    }
                    ForEach(filteredUsers) { user in
                        UserCard(user: user, usertype: user.usertype)
                    }
                }
                .listStyle(PlainListStyle())
                .padding()
                
                Spacer()
            }.ignoresSafeArea(edges: .top)
            .onAppear {
                viewModel.viewAppeared()
            }
        }
    }
}
