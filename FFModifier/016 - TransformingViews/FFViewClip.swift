//
//  FFViewClip.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/21.
//
//  如何裁剪View，使部分可见
//  SwiftUI允许你裁剪任何视图来控制他的形状，这都是通过使用clipShape()修饰符实现的。

import SwiftUI

struct FFViewClip: View {
    var body: some View {
        Button {
            print("Button was pressed!")
        } label: {
            Image(systemName: "bolt.fill")
                .foregroundStyle(.white)
                .padding()
                .background(.green)
                .clipShape(Circle())
        }
        //Circle剪辑形状将始终从视图中生成圆，即使他们的高度和宽度不相等。它只会裁剪较大的值以匹配较小的值。
        //除了Circle，还有Capsule，它可以将视图裁剪成菱形的圆角。类似胶囊形状
        Button {
            print("Pressed!")
        } label: {
            Image(systemName: "bolt.fill")
                .foregroundStyle(.white)
                .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                .background(.green)
                .clipShape(Capsule())
        }
        //我在哪里添加了一些更精确的padding来获得更准确的形状。
    }
}

#Preview {
    FFViewClip()
}
