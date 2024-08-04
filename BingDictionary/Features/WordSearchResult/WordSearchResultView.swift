//
//  WordSearchResultView.swift
//  DictionaryAnyWhere
//
//  Created by Bing Bing on 2024/8/4.
//

import SwiftUI

struct WordSearchResultView: View {
    var body: some View {
        VStack(spacing: 0) {
            PhoneticRow()
            EtymologyRow()
        }
    }
}

#Preview {
    WordSearchResultView()
}
