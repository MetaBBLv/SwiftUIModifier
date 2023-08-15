//
//  FFNavigationSplitViewContent.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/15.
//

import SwiftUI

struct FFNavigationSplitViewContent: View {
    var body: some View {
        //如果你想更近一步，NavigationSplitView允许我们在他的布局中添加第三个视图，它可以通过点击Button来显示。
        NavigationSplitView {
            Text("Sidebar")
        } content: {
            Text("Primary")
        } detail: {
            Text("Detail View")
        }
        //SwiftUI将自动显示一个按钮滑动在你的栏从屏幕的一边，也折叠它与你的猪视图，如果你在一个紧凑的大小类。
    }
}

#Preview {
    FFNavigationSplitViewContent()
}
