//
//  FFCustomText.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/28.
//
//  如何将文本视图组合在一起
//  SwiftUI文本视图重载了“+”运算符，可以将文本视图组合创建新的文本视图。
//  当你需要在视图中使用不同的格式时，可以使每个文本视图都不一样，让后将它们连接在一起形成单个组合文本视图。最方便的是，当使用朗读功能是，VoiceOver会自动将它们识别为一段文本。

import SwiftUI

struct FFCustomText: View {
    var body: some View {
        Text("SwiftUI")
            .font(.largeTitle)
        + Text("is")
            .font(.headline)
        + Text("awesome")
            .font(.footnote)
        
        //创建不同颜色或字体的文本
        Text("SwiftUI")
            .foregroundStyle(.red)
        + Text("is")
            .foregroundStyle(.orange)
            .fontWeight(.black)
        + Text("awesome")
            .foregroundStyle(.blue)
    }
}

#Preview {
    FFCustomText()
}
