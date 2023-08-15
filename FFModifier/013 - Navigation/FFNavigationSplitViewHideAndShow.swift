//
//  FFNavigationSplitViewHideAndShow.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/15.
//
//  如何隐藏和显示侧边栏
//  当在macOS上和iPad上使用NavigationSplitView时，SwiftUI允许我们使用NavigationSplitViewVisibility的enum来切换显示侧边栏、内容视图和详细视图

import SwiftUI

struct FFNavigationSplitViewHideAndShow: View {
    @State private var columnVisibility = NavigationSplitViewVisibility.detailOnly
    
    var body: some View {
        NavigationSplitView(columnVisibility: $columnVisibility) {
            Text("Sidebar")
        } content: {
            Text("Content")
        } detail: {
            VStack {
                Button("Detail Only") {
                    columnVisibility = .detailOnly
                }
                
                Button("Content and Detail") {
                    columnVisibility = .doubleColumn
                }
                
                Button("Show All") {
                    columnVisibility = .all
                }
            }
        }
        //有四种模式可以选择：
        //在.detailonly模式下，详细视图将占用应用程序的所有可用屏幕空间
        //在doublecolumn模式下，你讲同时看到内容视图和详细视图
        //在.all模式下，如果存在，系统将尝试显示所有三个视图。在没有内容视图（中间视图）的情况下，它将只显示两个。
        //在.automatic,系统将自动更具当前设备和方向做最好的UI布局
        //注意：提供colunmVisibility是使用绑定完成的，因为当用户与UI交互时，value将自动更新。
        //虽然SwiftUI对分屏视图界面的这三个部分使用了不同的名称，但他们与UIKit的对应部分直接匹配：在UIKit中，侧sidebar时”主要的“，content时“补充的”，detail是“次要的”
    }
}

#Preview {
    FFNavigationSplitViewHideAndShow()
}
