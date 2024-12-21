//
//  DataModel.swift
//  NeoSoftAssessmentSwiftUI
//
//  Created by Mukta on 13/12/24.
//

import Foundation

import SwiftUI
import Combine

// MARK: - Model
struct Item: Hashable {
    let displayName: String
    let image: String
}

struct Category {
    let name: String
    let items: [Item]
}

struct DataModel {
    let images: [String]
    let categories: [Category]
}