//
//  SwiftUICarouselView.swift
//  NeoSoftAssessmentSwiftUI
//
//  Created by Mukta on 12/12/24.
//

import SwiftUI


struct SwiftUICarouselView: View {
    
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
            ScrollView {
                VStack {
                    // Carousel
                    TabView(selection: $viewModel.currentIndex) {
                        ForEach(0..<dataModel.images.count, id: \.self) { index in
                            Image(dataModel.images[index])
                                .resizable()
                                .scaledToFit()
                                .tag(index)
                            
                        }
                    }
                    .tabViewStyle(PageTabViewStyle())
                    .frame(height: 300)
                    // List
                    LazyVStack(alignment: .leading , spacing: 10, pinnedViews: [.sectionHeaders]) {
                        Section(header: PinnedSearchBar(searchText: $viewModel.searchText)) {
                            ForEach(viewModel.filteredItems, id: \.self) { item in
                            HStack {
                                Image(item.image)
                                    .resizable()
                                    .frame(width: 40,height: 40)
                                Text(item.displayName)
                            }.padding()
                        }
                        }
                    }
                }
            }
    }
}

struct PinnedSearchBar: View {
    @Binding var searchText: String
    
    var body: some View {
        HStack {
            TextField("Search...", text: $searchText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
        }
        .background(Color(UIColor.systemBackground))
        .frame(maxWidth: .infinity)
    }
}
