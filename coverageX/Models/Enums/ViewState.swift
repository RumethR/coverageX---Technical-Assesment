//
//  ViewState.swift
//  coverageX
//
//  Created by Rumeth Randombage on 2025-06-27.
//

enum ViewState<Content> {
    case content(Content)
    case loading
    case error
}
