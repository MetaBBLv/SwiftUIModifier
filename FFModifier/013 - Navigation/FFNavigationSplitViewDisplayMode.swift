//
//  FFNavigationSplitViewDisplayMode.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/15.
//
//  如何自定义NavigationSplitView的显示模式
//  SwiftUI的NavigationSplitView有三个选项来控制侧面栏的显示方式，每个选项都可以使用navigationSplitViewStyle（）修饰符进行调整。
//
import SwiftUI

struct FFNavigationSplitViewDisplayMode: View {
    var body: some View {
        //第一个是.prominentDetail,它告诉SwiftUI你想让细节视图一直保持完整的大小--侧边栏和内容视图会滑动到Detail视图上，而不是把他推到一边或把它挤得更小。
        NavigationSplitView {
            Text("Sidebar")
        } content: {
            Text("Content")
        } detail: {
            Text("Detail")
        }
        .navigationSplitViewStyle(.prominentDetail)
        
        //第二个选项是.balanced，这将在显示侧边栏或Content栏时减少Detail视图的大小--只需将.prominentDetail切换为.balance

    }
}

#Preview {
    FFNavigationSplitViewDisplayMode()
}
