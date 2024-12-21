//
//  SwiftUICarouselView.swift
//  NeoSoftAssessmentSwiftUI
//
//  Created by Mukta on 12/12/24.
//

import SwiftUI
import Combine

struct BottomSheetView: View {
    @State private var showBottomSheet = false
    @ObservedObject private var viewModel: SwiftUICarouselViewModel
    
    init(viewModel: SwiftUICarouselViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                Button(action: { showBottomSheet.toggle() }) {
                    Image(systemName: "ellipsis")
                        .font(.largeTitle)
                        .padding()
                }
            }
        }
        .sheet(isPresented: $showBottomSheet) {
            VStack {
                Text("StatisticsTitle")
                    .font(.headline)
                Text("Total Items: \(viewModel.statistics.itemCount)")
                ForEach(viewModel.statistics.topChars, id: \.0) { char, count in
                    Text("\(char): \(count)")
                }
            }
            .padding()
        }
    }
}

struct SwiftUICarouselView: View {
    @ObservedObject private var viewModel: SwiftUICarouselViewModel
    
    init(viewModel: SwiftUICarouselViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack {
                    // Carousel
                    TabView(selection: $viewModel.currentIndex) {
                        ForEach(0..<viewModel.dataImages.count, id: \.self) { index in
                            Image(viewModel.dataImages[index])
                                .resizable()
                                .scaledToFit()
                                .tag(index)
                        }
                    }
                    .tabViewStyle(PageTabViewStyle())
                    .frame(height: 300)

                    // List
                    LazyVStack(alignment: .leading, spacing: 10, pinnedViews: [.sectionHeaders]) {
                        Section(header: PinnedSearchBar(searchText: $viewModel.searchText)) {
                            ForEach(viewModel.filteredItems, id: \.self) { item in
                                HStack {
                                    Image(item.image)
                                        .resizable()
                                        .frame(width: 40, height: 40)
                                    Text(item.displayName)
                                }.padding()
                            }
                        }
                    }
                }
            }
            HStack {
                Spacer()
                BottomSheetView(viewModel: viewModel)
                    .padding(.bottom)
                    .padding(.trailing, 16)
            }
        }
    }
}

struct PinnedSearchBar: View {
    @Binding var searchText: String
    
    var body: some View {
        HStack {
            TextField("SearchPlaceHolder", text: $searchText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
        }
        .background(Color(UIColor.systemBackground))
        .frame(maxWidth: .infinity)
    }
}
