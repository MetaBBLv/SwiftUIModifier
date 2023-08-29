//
//  FFScrollingVertical.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/29.
//
//  如何启用垂直页面滚动
//  SwiftUI提供了一种.verticalPage选项卡视图样式，可以在watchOS上制作垂直滚动的选项卡，而不是默认的水平滚动选项卡。因为他们与滚动list一起存在，所以仔细考虑将两者一起搭配使用。

import SwiftUI
#if watchOS
struct FFScrollingVertical: View {
    var body: some View {
        TabView {
            Text("First")
                .navigationTitle("First Title")
            Text("Second")
                .navigationTitle("Second Title")
            Text("Third")
                .navigationTitle("Third Title")
        }
        .tabViewStyle(.verticalPage)
        //当用户滚动时，watchOS将自动使用每个选项卡的导航Title
        //在处理选项卡内的其他滚动容器是，必须不断滚动到选项卡中的最后一个视图，否者用户可能会尝试快速浏览并意外更改选项卡。
        
        TabView {
            Text("First")
                .navigationTitle("First Title")
            Text("Second")
                .navigationTitle("Second Title")
            List(0..<50) { i in
                Text("meta \(i)")
            }
            .navigationTitle("Meta Title")
        }
        .tabViewStyle(.verticalPage)
    }
}

#Preview {
    FFScrollingVertical()
}
#endif
