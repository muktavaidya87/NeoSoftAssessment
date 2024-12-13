//
//  Untitled.swift
//  NeoSoftAssessmentSwiftUI
//
//  Created by Mukta on 13/12/24.
//

import XCTest

@testable import NeoSoftAssessmentSwiftUI

class SearchViewModelTests: XCTestCase {
    var viewModel: ViewModel!
    
    override func setUp() {
        super.setUp()
        viewModel = ViewModel()
    }
    
    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }
    
    func testInitialFilteredItems() {
        XCTAssertEqual(viewModel.filteredItems.count, 18)
        
        func testFilteringItems() {
            // Simulate typing "Item 1"
            viewModel.searchText = "apple"
            
            // Check the filtered items
            let filtered = viewModel.filteredItems
            XCTAssertEqual(filtered.count,1)
            XCTAssertEqual(filtered[0].displayName, "Apple")
        }
        
        func testNoMatchingItems() {
            // Simulate typing "Nonexistent"
            viewModel.searchText = "Nonexistent"
            
            // Check if there are no results
            XCTAssertTrue(viewModel.filteredItems.isEmpty)
        }
        
        func testSearchTextReset() {
            // Simulate typing something in search
            viewModel.searchText = "Item 1"
            XCTAssertEqual(viewModel.filteredItems.count, 4)
            
            // Simulate clearing the search text
            viewModel.searchText = ""
            XCTAssertEqual(viewModel.filteredItems.count, 4)
        }
    }
}
