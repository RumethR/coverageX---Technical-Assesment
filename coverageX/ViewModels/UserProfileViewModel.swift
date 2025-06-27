//
//  UserProfileViewModel.swift
//  coverageX
//
//  Created by Rumeth Randombage on 2025-06-27.
//

import Foundation

class UserProfileViewModel: ObservableObject {
    @Published var viewState: ViewState<CoverageXUser> = .loading
}
