//
//  FFBorderEffect.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/19.
//
//  如何创建虚线边框
//  SwiftUI的border可以配置破折号，这让我们可以非常精细的控制线条的绘制方式，

import SwiftUI

struct FFBorderEffect: View {
    @State private var phase = 0.0
    var body: some View {
        Spacer()
        Rectangle()
            .strokeBorder(style: StrokeStyle(lineWidth: 4, dash: [10]))
        //使用[10]作为dash参数意味着SwiftUI将绘制我们的喵天的10个点，然后绘制10个点的空间，重复该模式，知道整个矩形被描边。它是一个数组，因为你可以提供多个值，例如[10，5],10表示秒变长度，5表示间隙。
        //当你添加破折号时，就会变得非常有趣，它决定了破折号和间隙应该放在哪里。如果我们将该阶段存储在状态属性中，那么我们就可以随着时间的推移将该值动画化，一创建所谓的动态虚线描边。
        Spacer()
        Rectangle()
            .strokeBorder(style: StrokeStyle(lineWidth: 4,dash: [10], dashPhase: phase))
            .frame(width: 200, height: 200)
            .onAppear {
                withAnimation(.linear.repeatForever(autoreverses: false), {
                    phase -= 20
                })
            }
        Spacer()
    }
}

#Preview {
    FFBorderEffect()
}
