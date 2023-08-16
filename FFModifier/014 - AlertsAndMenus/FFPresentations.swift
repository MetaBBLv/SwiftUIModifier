//
//  FFPresentations.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/16.
//  关于Presentations
//  SwiftUI的声明式编程思想意味着我们不会像在UIKit中那样创建和呈现警报和动作表。相反，我们定义了他们应该显示的条件，告诉它他们应该是什么样子，然后让他自己决解剩下的问题。
//  这都是使用修饰符完成的，修饰符将新的UI附加到我们的视图中，当满足条件时将显示该视图。你可以随意的添加，它们实际上是等待，直到他们饿条件成真，此时他们会显示自己的UI。例如，你可以在按下按钮时切换bool值，浙江出发警报。
//  你可以将presentations附加到你的主视图或他的任何子视图，甚至是调整你的状态以触发presentations的按钮。这是一个微妙的区别，但重要的是要理解，这些present不是附加到按钮，因为它是一个按钮。也就是说，这不会以任何方式使警报显示，因为按钮被点击。相反，我们将它附加到我们的视图层次结构，一边SwiftUI知道它可能在任何时候显示。

import SwiftUI

struct FFPresentations: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    FFPresentations()
}
