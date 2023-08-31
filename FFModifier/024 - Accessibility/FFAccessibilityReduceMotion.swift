//
//  FFAccessibilityReduceMotion.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/31.
//
//  如何检测“reduce motion”的关联功能设置
//  随着iOS的发展，越来越多的用户对画面更加敏感、更挑剔，尤其是那些大型或复杂的动画。因此，iOS有一个名为“reduce motion”的内置辅助功能设置，应用程序可以读取该设置并根据需要做出响应。

import SwiftUI

struct FFAccessibilityReduceMotion: View {
    //在SwiftUI中，此设置作为环境的Bool值公布，将其属性添加到视图中
    @Environment(\.accessibilityReduceMotion) var reduceMotion
    @State private var scale = 1.0
    
    var body: some View {
        //现在由需求来决定“reduce motion”的具体含义
        //- 删除动画？
        //- 还是将动画更改为不那么强烈？
        //- 是否应该保留一些重要的动画并删除那些视觉吸引力的动画？
        //例如，如果希望为大多数用户提供弹性动画，但对于想要reduce motion的用户根本不需要动画，如何设定。
        VStack {
            Spacer()
            Circle()
                .frame(width: 20, height: 20)
                .scaleEffect(scale)
                .animation(reduceMotion ? nil : .spring(response: 1, dampingFraction: 0.1), value: scale)
            Spacer()
            Button("Increase scale") {
                scale *= 1.5
            }
        }
        //这会创建一个小圆圈，每次按下按钮时都会通过弹簧动画将其放大。但如果用户启用“reduce motion”，动画将被完全删除。
    }
}

#Preview {
    FFAccessibilityReduceMotion()
}
