//
//  PrimaryUserListView.swift
//  coverageX
//
//  Created by Rumeth Randombage on 2025-06-27.
//

import SwiftUI

struct PrimaryUserListView: View {
    @StateObject var viewModel: PrimaryUserListViewModel = .init()
    
    var body: some View {
        Group {
            switch viewModel.viewState {
            case .content(let content):
                List(content) { user in
                    NavigationLink(destination: UserProfileView(user)) {
                        UserListRowView(user: user)
                    }
                }
            case .loading:
                ProgressView()
            case .error:
                Text("Oh no. Something went wrong :(. Pull down to try again.")
                    .font(.largeTitle)
                    .foregroundStyle(.red)
            }
        }
        .task {
            await viewModel.fetchUsers()
        }
        .refreshable {
            await viewModel.fetchUsers()
        }
        .navigationTitle("Users")
    }
}

#Preview {
    PrimaryUserListView()
}
