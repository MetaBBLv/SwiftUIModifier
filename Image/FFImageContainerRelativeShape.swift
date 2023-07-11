//
//  FFImageContainerRelativeShape.swift
//  FFModifier
//
//  Created by BBLv on 2023/7/11.
//
// SwiftUI有许多不言自明的内置形状，但有一个很突出ContainerRelativeShape。这不是一个固定的形状，而是被设计为它所放置的任何形状的可插入版本，这在创建屏幕小组件时尤为重要
// 重要提示：目前，ContainerRelativeShape禁用于小组件内部，你可以在其他地方使用，但是仅仅表现为一个矩形

import SwiftUI

struct FFImageContainerRelativeShape: View {
    var body: some View {
        //我们可以编写在小部件中绘制蓝色形状的代码，并使用ContainerRelativeShape来确保它与小部件本身形状相同
        ZStack {
            ContainerRelativeShape()
                .inset(by: 4)
                .fill(.blue)
            
            Text("Hello, World!")
                .font(.title)
                .foregroundStyle(.white)
        }
        .frame(width: 300, height: 200)
        .background(.red)
        .clipShape(Capsule())
        
    }
}

#Preview {
    FFImageContainerRelativeShape()
}
