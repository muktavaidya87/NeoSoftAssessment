//
//  ViewModel.swift
//  NeoSoftAssessmentSwiftUI
//
//  Created by Mukta on 13/12/24.
//
import Combine

class SwiftUICarouselViewModel: ObservableObject {
    // Published properties to be observed by the view
    @Published var currentIndex: Int = 0
    @Published var searchText: String = ""
    
    private let dataModel: DataModel
    private var itemStatistics: ItemStatistics

    // Injected dependencies
    init(dataModel: DataModel, itemStatistics: ItemStatistics) {
        self.dataModel = dataModel
        self.itemStatistics = itemStatistics
    }
    
    // Computed properties for data handling
    var dataImages: [String] {
        return dataModel.images
    }
    
    var currentItems: [Item] {
        return dataModel.categories[currentIndex].items
    }
    
    var filteredItems: [Item] {
        if searchText.isEmpty {
            return currentItems
        } else {
            return currentItems.filter { $0.displayName.lowercased().contains(searchText.lowercased()) }
        }
    }
    
    var statistics: (itemCount: Int, topChars: [(Character, Int)]) {
        return itemStatistics.calculateStatistics(for: currentItems)
    }
    
    func setCategoryIndex(_ index: Int) {
        currentIndex = index
    }
}
