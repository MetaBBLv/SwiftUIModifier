//
//  FFViewScale.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/21.
//
//  如何放大或缩小视图
//  SwiftUI的scaleEffect()修饰符让我们可以自由的放大或缩小视图。

import SwiftUI
    
struct FFViewScale: View {
    var body: some View {
        //放大
        Text("Hello, World!")
            .scaleEffect(3)
            .frame(width: 300, height: 100)
        Spacer()
        //在X轴与Y轴之上做更改，可以压缩图像
        Text("Hello, World!")
            .scaleEffect(x: 1, y: 5)
            .frame(width: 300, height: 100)
        Spacer()
        //指定一个锚点进行缩放。
        Text("Hello, World!")
            .scaleEffect(2, anchor: .bottomTrailing)
        //获得一个两倍大小的文本视图，从右下角开始缩放。
        //提示：缩放视图不会导致它以新的大小重新绘制，只会在不同方向上拉伸。这意味着小的文本开起来模糊，小的图像可能看起来像素化或模糊
        Spacer()
        //对照组
        Text("Hello, World!")
        Spacer()
    }
}

#Preview {
    FFViewScale()
}
