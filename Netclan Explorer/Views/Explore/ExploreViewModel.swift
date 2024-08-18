//
//  ExploreViewModel.swift
//  Netclan Explorer
//
//  Created by Tamuna Kakhidze on 18.08.24.
//

import Foundation
import NetworkServicePackage

class ExploreViewModel: ObservableObject {
    // MARK: - Properties
    
    @Published var usersArray = [User]()
    @Published var searchText: String = ""
    private let url = "https://mocki.io/v1/1a54b226-34a8-4b71-8213-ab30309ae33b"
    
    var filteredUsers: [User] {
           if searchText.isEmpty {
               return usersArray
           } else {
               return usersArray.filter { user in
                   user.name.lowercased().contains(searchText.lowercased())
               }
           }
       }
    
    // MARK: - Fetching Data
    
    func viewAppeared() {
        fetchData() { [weak self] result in
            switch result {
            case .success(let success):
                self?.usersArray = success
                print(success)
            case .failure(let failure):
                print("fetching failed. \(failure)")
            }
        }
    }
    
    func fetchData(completion: @escaping (Result<[User],Error>) ->(Void)){
        NetworkService().getData(urlString: url, completion: completion)
    }
}
