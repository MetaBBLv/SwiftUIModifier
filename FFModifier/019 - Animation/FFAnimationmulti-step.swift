//
//  FFAnimationmulti-step.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/25.
//
//  如何使用相位动画器创建多步动画
//  SwiftUI的phaseAnimator视图和phaseAnimator修改器可以通过持续或触发时循环选择动画段来执行多步动画，创建这些多阶动画需要三个步骤
//1. 定义阶段，可以是任何类型的序列，但使用枚举最简单CaseIterable。
//2. 读取相位动画中的一个相位，并调整视图以匹配想要该相位的外观。
//3. 添加一个触发器，使相位动画从头开始重复其序列

import SwiftUI

//通过枚举设置
enum AnimationPhase: Double, CaseIterable {
    case fadingIn = 0
    case middle = 1
    case zoomingOut = 3
}

//可以根据你的命令触发动画序列，而不是无休止的重复。为此，可以添加一个触发器值并且通过SwiftUI监视，例如随机数UUID或递增数，当值发生变化时，开始动画并完整播放。
enum AnimationPhase1: CaseIterable {
    case start, middle, end
}

//向动画增加计算属性
enum AnimationPhase2: CaseIterable {
    case fadingIn, middle, zoomingOut
    
    var scale: Double {
        switch self {
        case .fadingIn: 0
        case .middle: 1
        case .zoomingOut: 3
        }
    }
    
    var opacity: Double {
        switch self {
        case .fadingIn: 0
        case .middle: 1
        case .zoomingOut: 0
        }
    }
}

struct FFAnimationmulti_step: View {
    @State private var animationStep = 0
    @State private var animationStep1 = 0
    
    var body: some View {
        //例如，创建一个简单动画，使某些文本开始很小且不可见，放大到自然大小并完全不透明，然后放大到非常大且不可见。
        Text("Hi, metaBBLv")
            .font(.largeTitle)
            .phaseAnimator([0,1,3]) { view, phase in
                view
                    .scaleEffect(phase)
                    .opacity(phase == 1 ? 1 : 0)
            }
        //由于没有提供触发器，所以它将永远运行。
        //使用包装视图PhaseAbunator来编写它，它的优点是多个视图可以在阶段之间一起移动
        VStack(spacing: 50) {
            PhaseAnimator([0,1,2]) { value in
                Text("Hi, metaBBLv")
                    .font(.largeTitle)
                    .scaleEffect(value)
                    .opacity(value == 1 ? 1 : 0)
                Text("Goodbye, metaBBLv")
                    .font(.largeTitle)
                    .scaleEffect(3 - value)
                    .opacity(value == 1 ? 1 : 0)
            }
        }
        Text("Hi, metaBBLv")
            .font(.largeTitle)
            .phaseAnimator(AnimationPhase.allCases) { view, phase in
                view
                    .scaleEffect(phase.rawValue)
                    .opacity(phase.rawValue == 1 ? 1 : 0)
            }
        //在下面的例子中，点击按钮会触发使用枚举情况的三步动画。首先，定义所需的各种动画阶段，然后每当属性发生变化时都会遍历。
        Button("Tap Me!") {
            animationStep += 1
        }
        .font(.largeTitle)
        .phaseAnimator(AnimationPhase1.allCases, trigger: animationStep) { content, phase in
            content
                .blur(radius: phase == .start ? 0 : 10)
                .scaleEffect(phase == .middle ? 3 : 1)
        }
        //为了获得更多的控制，可以准确指定每个阶段使用那个动画。.bouncy在快速和慢速动画之间移动.easeInOut获得更多的变化。
        Button("Tap Me 1") {
            animationStep1 += 1
        }
        .font(.largeTitle)
        .phaseAnimator(AnimationPhase1.allCases, trigger: animationStep1) { content, phase in
            content
                .blur(radius: phase == .start ? 0 : 10)
                .scaleEffect(phase == .middle ? 3 : 1)
        } animation: { phase in
            switch phase {
            case .start, .end: .bouncy
            case .middle: .easeInOut(duration: 2)
            }
        }
        //由于通过计算属性添加了动画，所以在调用时更加的简洁
        Text("Hi, metaBBLv")
            .font(.largeTitle)
            .phaseAnimator(AnimationPhase2.allCases) { content, phase in
                content
                    .scaleEffect(phase.scale)
                    .opacity(phase.opacity)
            }

    }
}

#Preview {
    FFAnimationmulti_step()
}
