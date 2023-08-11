//
//  FFStackPrimary.swift
//  FFModifier
//
//  Created by BBLv on 2023/7/18.
//
//  如何使用VStack和HStack创建stack
//  我们的 SwiftUI 内容视图必须包含一个或多个视图，这是我们希望它们显示的布局。 当我们想要一次在屏幕上显示多个视图时，您通常会想要告诉 SwiftUI 如何排列它们，这就是堆栈的用武之地。
//  Stack - 相当于 UIKit 中的 UIStackView - 具有三种形式：水平 (HStack)、垂直 (VStack) 和基于深度 (ZStack)，当您想要放置子视图以使它们重叠时，使用后者。

import SwiftUI

struct FFStackPrimary: View {
    var body: some View {
        List {
            Section {
                Text("Hello, SwiftUI")
            }
            
            Section {
                VStack {
                    Text("Hello")
                    Text("SwiftUI")
                }
            }
            
            Section {
                HStack {
                    Text("Hello")
                    Text("SwiftUI")
                }
            }
        }
    }
}

#Preview {
    FFStackPrimary()
}
