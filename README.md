# 📱 SwiftUI User List App

A simple SwiftUI app that displays a list of users with their names and profile thumbnails. A lightweight with URLSession networking layer, and loading/error state management.
---

## Compiled on Xcode 16.2, Minimum deployment target is iOS 16.6

## Approach

- SwiftUI interface
- Loading and error states via `ViewState` enum
- Remote image handling with `AsyncImage`
- MVVM architecture
- Pull to refresh implemented
- Networking implemented with URL Session and basic error endling using a predefined enum of errors.

## Aids
- View structures were generated with the help of ChatGPT.
- Response DTO was created using quickType.io 

## Answers to questions in the technical assestment specification

• What were your priorities, and why? 
    - To demonstrate that I have a fundamental understanding of MVVM, a good level of understanding on concepts such as state management, generics, concurrency, propery wrappers, etc. 

• If you had another two days, what would you have tackled next?
  - Demonstrate the usage of tests, using standardized libraries such as Alamofire for networking and/or SDWebImage, KingFisher for image handling. Implementing response caching, adding a splash screen with a Storyboard, localization etc.

• What would you change about the structure of the code?
  - I would add a BaseViewModel that all other view models would inherit, re-organizing the files a bit more. Create more 'breathtaking' views

• What bugs did you find but not fix?
  - There the navigation bar back button in the Profile view indicates the navigation title of the previous view. I wanted to remove it but was not able to.
 
• What would you change about the visual design of the app?
  - Creating a standard color scheme, creating typography styles.

(PS. the 1170-PM contributor on this repo is just my work account. I can show ownership if necessary)

## Folder Structure OverView
UserListApp/
│
├── Models/
│   └── CoverageXUser.swift
│
├── ViewModels/
│   └── UserListViewModel.swift
│
├── Services/
│   ├── NetworkService.swift
│   ├── DefaultNetworkService.swift
│   ├── Endpoint.swift
│   └── NetworkError.swift
│
├── Views/
│   └── UserListView.swift
│
└── Resources/
└── Assets.xcassets
