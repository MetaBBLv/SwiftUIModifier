//
//  FFTextEditorBackground.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/21.
//

import SwiftUI

struct FFTextEditorBackground: View {
    @State private var bio = "Describe yourself"
    var body: some View {
        //隐藏TextEditor的默认背景，用渐变替代
        TextEditor(text: $bio)
            .scrollContentBackground(.hidden)
            .background(LinearGradient(colors: [.white, .gray], startPoint: .top, endPoint: .bottom))
    }
}

#Preview {
    FFTextEditorBackground()
}
