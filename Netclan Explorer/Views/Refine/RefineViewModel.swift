//
//  RefineViewModel.swift
//  Netclan Explorer
//
//  Created by Tamuna Kakhidze on 17.08.24.
//

import Foundation

// MARK: - RefineViewModel

class RefineViewModel: ObservableObject {
    
    // MARK: - Properties

    @Published var selectedAvailability = "Available | Hey Let's Connect"
    @Published var availabilityList = [
        "Available | Hey Let's Connect",
        "Away | Stay discreet and watch"
    ]
    @Published var status = ""
    @Published var distance: Double = 1
    @Published var purposes: [Purpose] = [
        Purpose(id: 1, text: "Coffee"),
        Purpose(id: 2, text: "Business"),
        Purpose(id: 3, text: "Hobbies"),
        Purpose(id: 4, text: "Friendship"),
        Purpose(id: 5, text: "Movies"),
        Purpose(id: 6, text: "Dining"),
        Purpose(id: 7, text: "Dating"),
        Purpose(id: 8, text: "Chat")
    ]
    
    @Published var selectedPurposes: [Purpose] = []
    
    // MARK: - Lifecycle

    init() {
        loadInfo()
    }
    
    // MARK: - Methods - saving and retrieving data from userdefaults

    func saveInfo(availability: String, status: String, distance: Double, purpose: [Purpose]) {
        let selectedPurposesText = purposes.filter { $0.isSelected }.map { $0.text }
        
        UserDefaults.standard.set(availability, forKey: "SelectedAvailability")
        UserDefaults.standard.set(status, forKey: "Status")
        UserDefaults.standard.set(distance, forKey: "Distance")
        UserDefaults.standard.set(selectedPurposesText, forKey: "SelectedPurposes")
        print("saved")
        
    }
    
    func loadInfo() {
        if let savedAvailability = UserDefaults.standard.string(forKey: "SelectedAvailability") {
            selectedAvailability = savedAvailability
        }
        
        if let savedStatus = UserDefaults.standard.string(forKey: "Status") {
            status = savedStatus
        }
        
        if let savedDistance = UserDefaults.standard.double(forKey: "Distance") as? Double {
            distance = savedDistance
        }
        
        if let savedPurposesText = UserDefaults.standard.array(forKey: "SelectedPurposes") as? [String] {
            for i in 0..<purposes.count {
                if savedPurposesText.contains(purposes[i].text) {
                    purposes[i].isSelected = true
                }
            }
        }
    }
}
