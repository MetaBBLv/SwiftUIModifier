//
//  FFTextEditor.swift
//  FFModifier
//
//  Created by BBLv on 2023/7/25.
//
//  如何通过TextEditor创建多行可编辑文本
//  SwiftUI的TextEditor用于处理多行滚动文本的视图。你可以根据需要设置字体、更改颜色，甚至可以调整行距和行数

import SwiftUI

struct FFTextEditor: View {
    @State private var profileText = "Enter your bio"
    
    var body: some View {
        // 创建TextEditor
        NavigationStack {
            TextEditor(text: $profileText)
                .foregroundStyle(.secondary)
                .padding(.horizontal)
                .navigationTitle("About you")
        }
    }
}

#Preview {
    FFTextEditor()
}
