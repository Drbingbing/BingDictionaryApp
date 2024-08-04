//
//  Dot.swift
//  DictionaryAnyWhere
//
//  Created by Bing Bing on 2024/8/4.
//

import SwiftUI

struct Dot: View {
    var size: CGFloat = 4
    var color: Color = .black
    
    var body: some View {
        Circle()
            .frame(width: size, height: size)
            .foregroundStyle(color)
    }
}

#Preview {
    Dot()
}
