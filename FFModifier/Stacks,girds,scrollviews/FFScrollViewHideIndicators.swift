//
//  FFScrollViewHideIndicators.swift
//  FFModifier
//
//  Created by BBLv on 2023/7/19.
//
//  如何隐藏ScrollView、List的滚动指示器
//  SwiftUI的ScrollIndicators()修饰符控制是否显示滚动指示器--这些闪烁的小条既能让用户了解内容的大小，又允许长按滚动
import SwiftUI

struct FFScrollViewHideIndicators: View {
    var body: some View {
        List(1..<100) { i in
            Text("Row \(i)")
        }
        .scrollIndicators(.hidden)
        
        /**ScrollIndicatorVisibility有四个枚举值：
            .automatic：这是没有应用修饰符的行为
            .visible：可以在iOS上显示自动隐藏滚动指示器，或在macOS上根据用户偏好设置来决定是否隐藏
            .hidden：可以隐藏iOS上的指示器，并在大多数情况下macOS上隐藏，如果用户链接鼠标，滚动指示器重新显示
            .never：可以在iOS和macOS上隐藏指示器，无论用户使用的指针设备时什么
         */
    }
}

#Preview {
    FFScrollViewHideIndicators()
}
