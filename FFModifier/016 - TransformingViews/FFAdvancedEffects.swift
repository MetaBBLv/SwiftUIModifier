//
//  FFAdvancedEffects.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/19.
//
//  如何使用更多的修饰符创建更加复杂的UI
//  添加到视图中的每个修饰符都会调整之前的任何修饰符，并可以多次重复修饰符。

import SwiftUI

struct FFAdvancedEffects: View {
    var body: some View {
        Text("Hello, metaBBLv")
            .font(.largeTitle)
            .foregroundStyle(.white)
            .padding()
            .background(.red)
            .padding()
            .background(.orange)
            .padding()
            .background(.yellow)
        //这对于创建阴影，可以根据需求来重复使用修饰符。
    }
}

#Preview {
    FFAdvancedEffects()
}
