//
//  Untitled.swift
//  NeoSoftAssessmentSwiftUI
//
//  Created by Mukta on 13/12/24.
//

import XCTest
@testable import NeoSoftAssessmentSwiftUI


class SwiftUICarouselViewModelTests: XCTestCase {
    
    var viewModel: SwiftUICarouselViewModel!
    
    override func setUp() {
        super.setUp()
        
        // Create mock DataModel and ItemStatistics
        let dataModel = DataModel(
            images: ["Nature1", "Nature2", "Nature3"],
            categories: [
                Category(name: "Fruits", items: [
                    Item(displayName: "Apple", image: "apple"),
                    Item(displayName: "Banana", image: "banana"),
                    Item(displayName: "Orange", image: "orange"),
                    Item(displayName: "Apples", image: "apple")
                ]),
                Category(name: "Vegetables", items: [
                    Item(displayName: "Carrot", image: "carrot"),
                    Item(displayName: "Spinach", image: "spinach")
                ])
            ]
        )
        let itemStatistics = ItemStatistics()
        
        // Initialize ViewModel with the mock data
        viewModel = SwiftUICarouselViewModel(dataModel: dataModel, itemStatistics: itemStatistics)
    }
    
    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }
    
    func testFilteredItems_whenSearchTextIsEmpty() {
        // Set current index to "Fruits"
        viewModel.currentIndex = 0
        
        // When searchText is empty
        viewModel.searchText = ""
        
        // Filtered items should return all items from the "Fruits" category
        let filteredItems = viewModel.filteredItems
        XCTAssertEqual(filteredItems.count, 4) // Apple, Banana, Orange
    }
    
    func testFilteredItems_whenSearchTextIsNonEmpty() {
        // Set current index to "Fruits"
        viewModel.currentIndex = 0
        
        // When searchText is "Apple"
        viewModel.searchText = "Apple"
        
        // Filtered items should only return "Apple"
        let filteredItems = viewModel.filteredItems
        XCTAssertEqual(filteredItems.count, 2)
        XCTAssertEqual(filteredItems.first?.displayName, "Apple")
    }
    
    func testStatistics_whenCalculatingItemCount() {
           // Set current index to "Fruits"
           viewModel.currentIndex = 0
           
           // Get statistics
           let statistics = viewModel.statistics
           
           // Check if item count is correct
           XCTAssertEqual(statistics.itemCount, 4) // 4 items in "Fruits" category
       }
       
       func testStatistics_whenCalculatingTopChars() {
           // Set current index to "Fruits"
           viewModel.currentIndex = 0
           
           // Get statistics
           let statistics = viewModel.statistics
           
           // Check top characters frequency
           XCTAssertEqual(statistics.topChars.count, 3) // Should return top 3 characters
           
           // Check if character 'A' is the most frequent
           XCTAssertTrue(statistics.topChars.contains { $0.0 == "p" && $0.1 == 4 })
       }
}
