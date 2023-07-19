//
//  FFStackZIndex.swift
//  FFModifier
//
//  Created by BBLv on 2023/7/18.
//
//  如何通过ZIndex更改视图分层的顺序
//  默认情况下，SwiftUI的ZStack使用画家算法来分层其视图来决定视图的深度：无论你先放入ZStack的什么内容都会被先绘制，然后后续的视图将在其上分层。虽然这通常是你想要的，但有时你需要更多的控制-例如，你可能虚妄在app运行时将一个视图推到另一个视图后面，或者在点击某个特定视图时将其置于前面。为此，你需要使用zIndex修饰符，它允许你准确指定视图在单个ZStack中如何分层。视图默认Z索引为0，但你可以设置正值或负值，分别将它们放置在其他视图的顶部或下方

import SwiftUI

struct FFStackZIndex: View {
    var body: some View {
        List {
            //此ZStack包含两个重叠的矩形，但绿色矩形仍然可见，因为它设置zIndex为1
            ZStack {
                Rectangle()
                    .fill(.green)
                    .frame(width: 50, height: 50)
                    .zIndex(1)
                Rectangle()
                    .fill(.red)
                    .frame(width: 100, height: 100)
            }
            //zIndex修饰符仅影响当前ZStack内的绘制顺序，如果你有两个ZStack，需要分别设定
        }
    }
}

#Preview {
    FFStackZIndex()
}
