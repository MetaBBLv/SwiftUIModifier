//
//  FFCustomModifiers.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/28.
//
//  如何创建自定义修饰符
//  如果发现重复的将同一组修饰符附加到视图（比如，背景色、padding、字体等等），那么可以通过创建一个修饰符来封装这些重复的修饰符。
//  如果你想创建自己的结构，那么要遵守ViewModifier协议。并且要实现一个body(content:)函数。

import SwiftUI

//创建一个新的PrimaryLabel修饰符，添加padding、background、foregroundcolor和font等
struct PrimaryLabel: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(.red)
            .foregroundStyle(.white)
            .font(.largeTitle)
    }
}

struct FFCustomModifiers: View {
    var body: some View {
        Text("Hello, SwiftUI")
            .modifier(PrimaryLabel())
    }
}

#Preview {
    FFCustomModifiers()
}
