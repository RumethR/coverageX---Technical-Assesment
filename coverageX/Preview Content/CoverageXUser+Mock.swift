//
//  CoverageXUser+Mock.swift
//  coverageX
//
//  Created by Rumeth Randombage on 2025-06-27.
//

import Foundation

#if DEBUG
extension CoverageXUser {
    static let mock: Self = .init(
        name: "Juan Manuel",
        thumbnailURL: "https://randomuser.me/api/portraits/thumb/men/58.jpg",
        email: "juanmanuel.navarrete@example.com",
        phoneNumber: "(611) 157 7656",
        profilePicture: "https://randomuser.me/api/portraits/thumb/men/58.jpg"
    )
}
#endif
