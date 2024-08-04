//
//  FlexibleStack.swift
//  DictionaryAnyWhere
//
//  Created by Bing Bing on 2024/8/4.
//

import SwiftUI

struct FlexibleStack<D: RandomAccessCollection, Content: View>: View where D.Element: Hashable {
    @State private var availableWidth: CGFloat = 0
    @State private var elementSizes: [D.Element: CGSize] = [:]
    
    let data: D
    let content: (D.Element) -> Content
    
    init(_ data: D, availableWidth: CGFloat, content: @escaping (D.Element) -> Content) {
        self.availableWidth = availableWidth
        self.data = data
        self.content = content
    }
    
    var body: some View {
        ZStack {
            Color.clear
                .frame(height: 1)
                .readSize { size in
                    availableWidth = size.width
                }
            VStack {
                ForEach(computeRows(), id: \.self) { rowElements in
                    HStack {
                        ForEach(rowElements, id: \.self) { element in
                            content(element)
                                .fixedSize()
                                .readSize { size in
                                    elementSizes[element] = size
                                }
                        }
                    }
                }
            }
        }
    }
    
    func computeRows() -> [[D.Element]] {
        var rows: [[D.Element]] = [[]]
        var currentRow = 0
        var remainingWidth = availableWidth
        
        for element in data {
            let elementSize = elementSizes[element, default: CGSize(width: availableWidth, height: 1)]
            
            if remainingWidth - elementSize.width >= 0 {
                rows[currentRow].append(element)
            } else {
                // start a new row
                currentRow = currentRow + 1
                rows.append([element])
                remainingWidth = availableWidth
            }
            
            remainingWidth = remainingWidth - elementSize.width
        }
        
        return rows
    }
}

#Preview {
    FlexibleStack(0..<20, availableWidth: 200) { _ in
        Text("1234")
            .padding(8)
            .background(Color.gray.opacity(0.2))
    }
    .frame(height: 200)
}
