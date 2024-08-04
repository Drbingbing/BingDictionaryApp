//
//  EtymologyRow.swift
//  DictionaryAnyWhere
//
//  Created by Bing Bing on 2024/8/4.
//

import SwiftUI
import Flow

struct EtymologyRow: View {
    var body: some View {
        VStack {
            HStack {
                Text("Etymology")
                    .font(.title3.bold())
                    .fontDesign(.rounded)
                Spacer()
            }
            
            SizeBoxed(height: 20)
            
            HStack(alignment: .center) {
                Text("noun")
                    .font(.headline.bold())
                    .fontDesign(.rounded)
                SizeBoxed(width: 20)
                Separator()
            }
            
            SizeBoxed(height: 20)
            
            HStack {
                Text("Meaning")
                    .foregroundStyle(.gray)
                    .fontDesign(.rounded)
                Spacer()
            }
            
            SizeBoxed(height: 20)
            
            ForEach(0..<5) { _ in
                DefinationRow()
            }
            
            SizeBoxed(height: 20)
            
            HStack {
                Text("Synonyms")
                    .foregroundStyle(.gray)
                    .fontDesign(.rounded)
                Spacer()
            }
            
            SizeBoxed(height: 20)
            
            HStack(alignment: .center) {
                Text("verb")
                    .font(.headline.bold())
                    .fontDesign(.rounded)
                SizeBoxed(width: 20)
                Separator()
            }
            
            SizeBoxed(height: 20)
            
            SynonymsRow()
            
            SizeBoxed(height: 20)
            
            Separator()
            
            SizeBoxed(height: 20)
            
            SourceLink()
        }
        .padding(.horizontal, 20)
    }
}

private struct DefinationRow: View {
    var body: some View {
        HStack(alignment: .center, spacing: 12) {
            Dot()
            Text("A male person.")
                .fontDesign(.rounded)
            Spacer()
        }
        .padding(.horizontal, 20)
    }
}

private struct SynonymsRow: View {
    var body: some View {
        HFlow {
            ForEach(0..<4) { _ in
                HStack {
                    Text("asshole")
                        .bold()
                        .fontDesign(.rounded)
                        .foregroundStyle(.purple)
                    SizeBoxed(width: 20)
                }
            }
        }
    }
}

private struct SourceLink: View {
    var body: some View {
        HStack(spacing: 12) {
            Text("Source")
            Text("https://en.wiktionary.org/wiki")
            Spacer()
        }
        .font(.caption)
        .fontDesign(.rounded)
        .foregroundStyle(.gray)
    }
}

#Preview {
    EtymologyRow()
}
