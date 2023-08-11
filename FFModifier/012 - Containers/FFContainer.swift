//
//  FFContainer.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/11.
//
//  Container原理
//  SwiftUI被设计成开箱即用，这意味着可以根据需求将一个视图放置在另一个视图中。
//  这在处理我们常用的主要容器视图时尤其有用，比如导航控制器和tabBar控制器。我们可以把任何视图放到另一个容器视图中，SwiftUI会自动调整它的布局，
//  在这方面，SwiftUI自己的容器--NavigationStack、TabView、Group等--与我们用自己的视图组合制作的容器没有什么不同。

import SwiftUI

struct FFContainer: View {
    var body: some View {
        Text("Hello, World!")
    }
}

#Preview {
    FFContainer()
}
