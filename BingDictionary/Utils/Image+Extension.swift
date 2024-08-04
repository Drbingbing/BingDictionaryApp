//
//  NavigationHeader+Extension.swift
//  DictionaryAnyWhere
//
//  Created by Bing Bing on 2024/8/4.
//

import SwiftUI

extension Image {
    func asNavigationItem(_ renderingMode: Image.TemplateRenderingMode? = nil) -> some View {
        return self
            .resizable()
            .renderingMode(renderingMode)
            .frame(width: 22, height: 22)
    }
    
    func asSearchBarIcon(_ renderingMode: Image.TemplateRenderingMode? = nil) -> some View {
        return self
            .resizable()
            .renderingMode(renderingMode)
            .frame(width: 20, height: 20)
    }
}
