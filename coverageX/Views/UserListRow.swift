//
//  UserListRowView.swift
//  coverageX
//
//  Created by Rumeth Randombage on 2025-06-27.
//

import SwiftUI

// Each list item should show the user's name and thumbnail image.
struct UserListRowView: View {
    let user: CoverageXUser

    var body: some View {
        HStack {
            AsyncImage(url: user.thumbnailURL) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 24, height: 24)
            } placeholder: {
                ProgressView()
            }
            .frame(width: 48, height: 48)
            .clipShape(Circle())

            Text(user.name)
                .font(.headline)
        }
    }
}

#Preview {
    UserListRowView(user: .mock)
}
