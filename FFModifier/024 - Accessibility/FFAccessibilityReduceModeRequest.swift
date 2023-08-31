//
//  FFAccessibilityReduceModeRequest.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/31.
//
//  如何根据需求减少动画
//  SwiftUI的withAnimation()修饰符可以轻松的在视图上执行自定义动画，但它不遵守“reduce mode”辅助功能的设置。因此对于有特定需求的人来讲，可能不符合需求了。

import SwiftUI

struct FFAccessibilityReduceModeRequest: View {
    @State private var scale = 1.0
    
    var body: some View {
        Text("Meta BBLv")
            .scaleEffect(scale)
            .onTapGesture {
                withOptionalAimation {
                    scale *= 1.5
                }
            }
    }
    
    //如果想要在withAnimation()同时遵守辅助功能的设置，添加一个全局函数可能是一个有效的解决方案
    func withOptionalAimation<Result>(_ animation: Animation? = .default, _ body: () throws -> Result) rethrows -> Result {
        if UIAccessibility.isReduceMotionEnabled {
            return try body()
        } else {
            return try withAnimation(animation, body)
        }
    }
    //在每次触发动画是，都会自动检查是否启用了“reduce mode”，并为特别请求reducemode的用户来禁用它。
}

#Preview {
    FFAccessibilityReduceModeRequest()
}
