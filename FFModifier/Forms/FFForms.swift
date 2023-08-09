//
//  FFForms.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/9.
//
//  Form原理
//  Swift坚定的专注于声明式用户界面，因此它为我们提供了一种构建表单的奇妙机制--用于收集信息的用户输入控件集合，比如订单或设置页面。
//  更棒的事，SwiftUI的一些部分会自动适应被放置在表单中，它们的外观和行为会发生变化，因此它们可以更好的与其他输入控件一起工作。
//  SwiftUI实际上动态调整布局，它可以根据你的代码运行的平台自动为我们制作全新的屏幕--它完全理解了我们的空间的目的和它们的视觉效果。这意味着我们通过描述告诉他想要什么，然后SwiftUI实现在当前平台上。
//  表单就像VStack一样的常规容器，可以根据你的目的在两者之间自由的切换

import SwiftUI

struct FFForms: View {
    var body: some View {
        Form {
            Text("Hello, World!")            
        }
    }
}

#Preview {
    FFForms()
}
