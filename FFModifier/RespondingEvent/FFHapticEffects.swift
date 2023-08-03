//
//  FFHapticEffects.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/2.
//
//  如何使用感觉反馈添加触觉效果
//  SwiftUI的sensoryFeedback()修改器为一些列简单的触觉提供内置支持，这意味着可以为成功、失败、选择、影响等创建震动效果
//  要出发反馈，请将sensoryFeedback()附加到任何视图，告诉她要制作什么样的效果以及触发器应该是什么--何时播放效果。SwiftUI将监视触发值，并在其发生变化时运行触觉效果。

import SwiftUI

struct FFHapticEffects: View {
    @State private var taskIsComplete = false
    @State private var randomNumber = 0.0
    
    var body: some View {
        //例如，如果你有一个将任务标记为已完成的按钮，则可以在完成时播放。
        Button("Mark Complete") {
            taskIsComplete = true
        }
        .sensoryFeedback(.success, trigger: taskIsComplete)
        
        //为了进行更细颗粒度的控制，你可以通过比较触发器的新旧值来确定触发哪种类型的触觉效果。例如，使用了.impact触觉效果，其强度根据两个随机数之间的差异而变化。
        Button("Mark Complete") {
            randomNumber = Double.random(in: 0...1)
        }
        .sensoryFeedback(trigger: randomNumber) { oldValue, newValue in
            let amount = abs(oldValue - newValue)
            return .impact(flexibility: .solid, intensity: amount)
        }
        
        //可以提供固定的触觉效果，并通过提供自己的比较函数来自定义何时触发。例如，当两个随机数之间的差异大于0.5时，触发.success触觉
        Button("Mark Complete") {
            randomNumber = Double.random(in: 0...1)
        }
        .sensoryFeedback(.success, trigger: randomNumber) { oldValue, newValue in
            abs(oldValue - newValue) > 0.5
        }
    }
}

#Preview {
    FFHapticEffects()
}
