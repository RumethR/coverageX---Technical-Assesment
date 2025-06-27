//
//  CoverageXUser.swift
//  coverageX
//
//  Created by Rumeth Randombage on 2025-06-27.
//

import Foundation

//Refer to PreviewContent for mock structs
struct CoverageXUser: Identifiable {
    let id = UUID()
    var name: String
    var thumbnailURL: String
    var email: String
    var phoneNumber: String
    var profilePicture: String
}
