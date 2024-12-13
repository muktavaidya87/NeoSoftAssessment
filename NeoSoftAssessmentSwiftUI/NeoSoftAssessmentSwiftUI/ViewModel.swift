//
//  ViewModel.swift
//  NeoSoftAssessmentSwiftUI
//
//  Created by Mukta on 13/12/24.
//
import SwiftUI

class ViewModel: ObservableObject {
    @Published var currentIndex: Int = 0
    @Published var searchText: String = ""
    var filteredItems: [Item] {
        if searchText.isEmpty {
            return dataModel.categories[currentIndex].items
        } else {
            return dataModel.categories[currentIndex].items.filter { $0.displayName.lowercased().contains(searchText.lowercased()) }
        }
    }
}
