//
//  FFNavigationSplitViewCustomize.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/15.
//
//  如何在NavigationSplitView中自定义一个视图的宽度
//  SwiftUI的NavigationSplitView为它呈现的视图使用系统标准宽度，但是通过navigationSPlitViewColumnWidth()修饰符，你可以尝试自定义它。
//  注意：系统可以选择忽略你指定的宽度。在编写文本时，此修饰符在iPhone上被忽略，而在iPad上仅适用于小于默认大小的值。
//  在其最简单的形式，发送一个单一的值给navigationSplitViewColumnWidth()导致它使用一个固定的大小，没有更小火更大。

import SwiftUI

struct FFNavigationSplitViewCustomize: View {
    var body: some View {
        NavigationSplitView {
            Text("Sidebar")
                .navigationSplitViewColumnWidth(100)
        } content: {
            Text("Content")
                .navigationSplitViewColumnWidth(200)
        } detail: {
            Text("Detail")
        }
        
    }
}

#Preview {
    FFNavigationSplitViewCustomize()
}
