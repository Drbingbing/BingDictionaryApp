//
//  Separator.swift
//  DictionaryAnyWhere
//
//  Created by Bing Bing on 2024/8/4.
//

import SwiftUI

struct Separator: View {
    
    var height: CGFloat = 1
    var color: Color = Color.gray.opacity(0.2)
    
    var body: some View {
        RoundedRectangle(cornerRadius: height / 2)
            .foregroundStyle(color)
            .frame(height: height)
    }
}

#Preview {
    Separator()
}
