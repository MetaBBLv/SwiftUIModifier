//
//  FFViewSafeArea.swift
//  FFModifier
//
//  Created by BBLv on 2023/7/17.
//
//  如何将内容放置在安全区域之外
// 默认情况下，SwiftUI视图将大部分留在安全区域内，它们将到达屏幕底部，但不会接近设备顶部的任何凹口，如果想更改，设置真正的全屏，添加修饰符ignoresSafeArea()

import SwiftUI

struct FFViewSafeArea: View {
    var body: some View {
        
        Text("Hello, World!")
            .frame(minWidth: 100, maxWidth: .infinity, minHeight: 100, maxHeight: .infinity)
            .foregroundStyle(.white)
            .background(.orange)
            .ignoresSafeArea()
    }
}

#Preview {
    FFViewSafeArea()
}
