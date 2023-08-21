//
//  FFViewRound.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/21.
//
//  如何设定更精确的圆角
//  SwiftUI视图都可以使用cornerRadius()修饰符来设置圆角。它采用一个简单的、以点数为单位的值来控制圆角。

import SwiftUI

struct FFViewRound: View {
    var body: some View {
        //创建一个15点圆角的文本视图。
        Text("Hello, World!")
            .padding()
            .background(.green)
            .cornerRadius(15)
        //此函数在iOS17上建议使用“Use `clipShape` or `fill` instead”
        //你可以使用带Capsule的ClipShape()修饰符自动将最短的边缘更加的圆润。
        Text("Hello, world!")
            .padding()
            .background(.green)
            .clipShape(Capsule())
    }
}

#Preview {
    FFViewRound()
}
