//
//  FFAnimationExlicit.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/25.
//
//  如何创建显式动画
//  如果将动画附加到视图上，最终会得到一个隐式动画。改变视图中的其他地方的一些状态可能会使用动画，及时你只是增加一个整数或者切换一个bool值。
//  另外一种时显式动画，在这种情况下，你不给有问题的视图附加修饰符，而是让SwiftUI对你想要做的精确的更改进行动画化。为此，将更改封装在withAnimation()中。

import SwiftUI

struct FFAnimationExlicit: View {
    @State private var opacity = 1.0
    
    var body: some View {
        Button("Press here") {
            withAnimation {
                opacity -= 0.2
            }
        }
        .padding()
        .font(.title)
        .background(.green)
        .opacity(opacity)
        //withAnimation()也可以接受参数，指定动画类型，因此也可以创建一个3s的线性动画withAnimation(.linear(duration: 3))
        //显式动画通常很有用，因为他们会使每个受影响的视图都产生动画，而不是仅仅是那些附加了隐式动画的视图。
    }
}

#Preview {
    FFAnimationExlicit()
}
