//
//  BottomSheetView.swift
//  NeoSoftAssessmentSwiftUI
//
//  Created by Mukta on 13/12/24.
//

import SwiftUI

struct BottomSheetView: View {
    @State private var showBottomSheet = false
    var items: [String]
        
    var statistics: (itemCount: Int, topChars: [(Character, Int)]) {
        let characterCount = items
                .flatMap { $0 }
                .reduce(into: [:]) { counts, char in counts[char, default: 0] += 1 }
            let sortedChars = characterCount.sorted { $0.value > $1.value }
        return (items.count, Array(sortedChars.prefix(3)))
        }
    
    var body: some View {
        ZStack {
             VStack {
                Spacer()
                Button(action: {
                    showBottomSheet = true
                }) {
                    Image(systemName: "ellipsis")
                        .font(.largeTitle)
                        .padding()
                }
            }
        }
        .sheet(isPresented: $showBottomSheet) {
            VStack {
                Text("Statistics")
                    .font(.headline)
                Text("Total Items: \(statistics.itemCount)")
                ForEach(statistics.topChars, id: \.0) { char, count in
                    Text("\(char): \(count)")
                }
            }
            .padding()
        }
    }
}
