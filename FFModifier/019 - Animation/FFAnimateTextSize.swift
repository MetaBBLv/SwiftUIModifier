//
//  FFAnimateTextSize.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/25.
//
//  文本size的Animation
//  从iOS16以后，SwiftUI可以将Text动画化。因此向下面这样的代码可以在两种不同的大小之间苹果的显示动画，自动的重新渲染文本。

import SwiftUI

struct FFAnimateTextSize: View {
    @State private var fontSize = 32.0
    
    var body: some View {
        Text("Hi, metaBBLv")
            .font(.custom("Georgia", size: fontSize))
            .onTapGesture {
                withAnimation(.spring(response: 0.5, dampingFraction: 0.5, blendDuration: 1).repeatForever()) {
                    fontSize = 72
                }
            }
    }
}

#Preview {
    FFAnimateTextSize()
}
