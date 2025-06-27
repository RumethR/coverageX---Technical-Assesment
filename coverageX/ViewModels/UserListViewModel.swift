//
//  Home.swift
//  coverageX
//
//  Created by Rumeth Randombage on 2025-06-27.
//

import Foundation

class PrimaryUserListViewModel: ObservableObject {
    private let networkService: NetworkService

    //Bound to the view
    @Published var allUsers: [CoverageXUser] = []
    @Published var viewState: ViewState<[CoverageXUser]> = .loading

    var response: RandomUserResponse?

    init(networkService: NetworkService = BaseNetworkService()) {
        self.networkService = networkService
    }

    func fetchUsers() async {
        let endpoint = Endpoint(path: "https://randomuser.me/api", method: .get, queryItems: [URLQueryItem(name: "results", value: "20")])

        do {
            response = try await networkService.request(endpoint, responseType: RandomUserResponse.self)

            let users: [CoverageXUser]? = response?.results?.compactMap { user in
                guard let firstName = user.name?.first,
                      let email = user.email,
                      let phone = user.phone
                else {
                    print("Returning nil for.... \(user.id?.value)")
                    return nil
                }

                return CoverageXUser(
                    name: firstName + " " + (user.name?.last ?? ""),
                    thumbnailURL: user.picture?.thumbnail ?? "",
                    email: email,
                    phoneNumber: phone,
                    profilePicture: user.picture?.large ?? ""
                )
            }
            
            await MainActor.run {
                guard let users = users else {
                    viewState = .error
                    return
                }

                viewState = .content(users)
            }
            
        } catch {
            print(error.localizedDescription)
            await MainActor.run {
                viewState = .error
            }
        }
    }
}
