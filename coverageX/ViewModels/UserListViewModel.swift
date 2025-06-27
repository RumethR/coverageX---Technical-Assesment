//
//  Home.swift
//  coverageX
//
//  Created by Rumeth Randombage on 2025-06-27.
//

import Foundation

class PrimaryUserListViewModel: ObservableObject {
    @Published var allUsers: [CoverageXUser] = []

    private let networkService: NetworkService
    
    init(networkService: NetworkService = BaseNetworkService()) {
        self.networkService = networkService
    }
    
    
}
