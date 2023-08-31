//
//  FFAccessibilityDecorative.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/31.
//
//  如何使用装饰图像来减少屏幕阅读器的混乱
//  SwiftUI会自动使用图像名称作为屏幕阅读器标签，通常情况下会很有用。然而，有些图像并不适合阅读，因为它只是装饰性的。它们不会传达屏幕其他地方没有的信息，只是为了让用户界面看起来更好看。
//Image("star")这种方式创建的图像，则会将她们作为标准UI的一部分读出。更好的方式是使用Image(decorative:)初始化程序来创建它们，它告诉SwiftUI图像不应该暴露给屏幕阅读去器。

import SwiftUI

struct FFAccessibilityDecorative: View {
    var body: some View {
        Image(decorative: "star")
        //通过这种方式构建的UI，使用VoiceOver检查时，屏幕阅读器是不会读出此标签的。
    }
}

#Preview {
    FFAccessibilityDecorative()
}
