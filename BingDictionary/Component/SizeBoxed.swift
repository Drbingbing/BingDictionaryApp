//
//  SizeBoxed.swift
//  DictionaryAnyWhere
//
//  Created by Bing Bing on 2024/8/4.
//

import SwiftUI

struct SizeBoxed: View {
    var height: CGFloat = 0
    var width: CGFloat = 0
    
    var body: some View {
        Spacer().frame(width: width, height: height)
    }
}
