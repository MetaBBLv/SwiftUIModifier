//
//  FFNavigationSplitViewCompact.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/15.
//
//  如何控制哪个NavigationSplitView列显示在紧凑的布局
//  当你有一个NavigationSplitView运行在一个紧凑的size class中，当你的应用程序被调整到一个小的size--SwiftUI试图猜测你的分屏视图列中哪一个是最好的显示，这种猜测通常是正确的，但你可以通过分屏视图设置首选紧凑列来控制它。

import SwiftUI

struct FFNavigationSplitViewCompact: View {
    @State private var preferredColumn = NavigationSplitViewColumn.detail
    var body: some View {
        //例如：这段代码强制将detail视图列为首选，从而覆盖了SwiftUI的默认选择
        NavigationSplitView(preferredCompactColumn: $preferredColumn) {
            Text("Sidebar View")
        } detail: {
            Text("Detail View")
        }
        //如果你提供了一个不存在的值--比如，当你只有sidebar和detail，你让他选择content--那么SwiftUI就会选择侧边栏。
    }
}

#Preview {
    FFNavigationSplitViewCompact()
}
