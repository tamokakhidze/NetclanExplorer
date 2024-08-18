//
//  RefineView.swift
//  Netclan Explorer
//
//  Created by Tamuna Kakhidze on 16.08.24.
//

import SwiftUI

// MARK: - RefineView

struct RefineView: View {
    
    // MARK: - Properties

    @StateObject private var viewModel = RefineViewModel()
    @State private var isInfoSaved = false
    
    // MARK: - Body

    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            
            Header(pageName: "Refine", location: "Tbilisi, Georgia")

            ScrollView(.vertical) {
                VStack(alignment: .leading, spacing: 30) {
                    Text("Select your availability")
                        .foregroundStyle(.primaryBlue)
                        .bold()
                    
                    Picker("Select an option", selection: $viewModel.selectedAvailability) {
                        ForEach(viewModel.availabilityList, id: \.self) { text in
                            Text(text)
                        }
                    }
                    .pickerStyle(.menu)
                    .foregroundStyle(.gray)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(8)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.gray, lineWidth: 1)
                    )
                    
                    Text("Add your status")
                        .foregroundStyle(.primaryBlue)
                        .bold()
                    
                    TextField("", text: $viewModel.status)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.gray, lineWidth: 1)
                                .frame(height: 80)
                        )
                        .frame(alignment: .topLeading)
                    
                    HStack {
                        Spacer()
                        Text("\(viewModel.status.count)/250")
                            .foregroundStyle(viewModel.status.count < 250 ? .gray : .red)
                    }
                    
                    Text("Select hyper local distance")
                        .foregroundStyle(.primaryBlue)
                        .bold()
                    
                    Slider(value: $viewModel.distance, in: 1...100)
                        .accentColor(.primaryBlue)
                        .padding(.horizontal)
                    
                    HStack {
                        Text("\(viewModel.distance, specifier: "%.0f")km")
                            .foregroundStyle(.gray)
                        
                        Spacer()
                        
                        Text("100km")
                            .foregroundStyle(.gray)
                    }
                    
                    Text("Select purpose")
                        .foregroundStyle(.primaryBlue)
                        .bold()
                    
                    LazyHGrid(rows: [GridItem(.fixed(50)),GridItem(.fixed(50)),GridItem(.fixed(50))], spacing: 20) {
                        ForEach($viewModel.purposes) { $purpose in
                            Button(action: {
                                purpose.isSelected.toggle()
                            }) {
                                Text(purpose.text)
                                    .frame(width: 100, height: 40)
                                    .background(
                                        RoundedRectangle(cornerRadius: 25)
                                            .stroke(purpose.isSelected ? Color.clear : Color.gray, lineWidth: 1)
                                            .background(purpose.isSelected ? .primaryBlue : Color.clear)
                                    )
                                    .cornerRadius(25)
                                    .foregroundStyle(purpose.isSelected ? Color.white : Color.black)
                                    .bold()
                            }
                        }
                    }
                    
                    HStack {
                        Spacer()
                        Button(action: {
                            viewModel.saveInfo(availability: viewModel.selectedAvailability, status: viewModel.status, distance: viewModel.distance, purpose: viewModel.selectedPurposes)
                            isInfoSaved = true
                        }) {
                            Text("Save and explore")
                                .frame(width: 300, height: 50)
                                .background(.primaryBlue)
                                .cornerRadius(50)
                                .foregroundStyle(.white)
                                .bold()
                        }
                        .alert("Info saved", isPresented: $isInfoSaved) {
                            Button("OK", role: .cancel) {}
                        }
                        Spacer()
                    }
                    
                    Spacer()
                    
                }.padding()
                
                Spacer()
            }
        }.ignoresSafeArea(edges: .top)
    }
}

#Preview {
    RefineView()
}
