//
//  UserDetailView.swift
//  coverageX
//
//  Created by Rumeth Randombage on 2025-06-27.
//

import SwiftUI

struct UserProfileView: View {
    @StateObject var viewModel: UserProfileViewModel = .init()
    let user: CoverageXUser

    init(_ user: CoverageXUser) {
        self.user = user
    }

    var body: some View {
        VStack(spacing: 16) {
            ScrollView {
                VStack(spacing: 16) {
                    // Profile Image
                    ZStack {
                        Color.blue.opacity(0.2)
                            .ignoresSafeArea()
                            .frame(height: 250)

                        AsyncImage(url: URL(string: user.profilePicture)) { phase in
                            switch phase {
                            case .empty:
                                ProgressView()
                            case .success(let image):
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 150, height: 150)
                                    .clipShape(Circle())
                                    .shadow(radius: 10)
                            case .failure:
                                Image(systemName: "person.crop.circle.badge.exclamationmark")
                                    .resizable()
                                    .frame(width: 150, height: 150)
                            @unknown default:
                                EmptyView()
                            }
                        }
                    }

                    // User Info
                    VStack(spacing: 8) {
                        Text(user.name)
                            .font(.largeTitle)
                            .fontWeight(.bold)

                        Text(user.email)
                            .foregroundColor(.gray)
                        
                        Text(user.phoneNumber)
                            .foregroundColor(.gray)
                        
                    }
                    .padding()
                }
            }
            
            Button(action: {
                // Handle edit
            }) {
                Text("Edit User")
                    .fontWeight(.semibold)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
        }
        .navigationTitle("Profile") //TODO: Localize texts
        .navigationBarTitleDisplayMode(.inline)

    }
}

#Preview {
    UserProfileView(.mock)
}
