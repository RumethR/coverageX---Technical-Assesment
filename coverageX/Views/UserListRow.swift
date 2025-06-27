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
            AsyncImage(url: URL(string: user.thumbnailURL)) { phase in
                switch phase {
                case .empty:
                    ProgressView() // or any loading placeholder

                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 24, height: 24)
                        .clipShape(Circle())

                case .failure:
                    // fallback or error icon
                    Image(systemName: "person.fill")
                        .resizable()
                        .frame(width: 24, height: 24)

                @unknown default:
                    EmptyView()
                }
            }

            Text(user.name)
                .font(.headline)

            Spacer()
        }
    }
}

#Preview {
    UserListRowView(user: .mock)
}
