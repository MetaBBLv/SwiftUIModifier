//
//  FFNavigationEdit.swift
//  FFModifier
//
//  Created by 小B同学 on 2023/8/13.
//
//  如何让用户编辑您的导航标题
//  SwiftUI的NavigationStack可以使用navigationTitle()显示一个简单的字符串，但同一修饰符也可接受字符串绑定，以便用户可以通过点击来编辑标题
//重要信息：只有当导航栏以内联模式运行时，导航标题编辑才有效。据我所知，它仅适用于iOS和iPadOS

import SwiftUI

struct FFNavigationEdit: View {
    @State private var title = "Wecome"
    var body: some View {
        //例如，显示“欢迎”的默认标题，用户可以点击该标题进行更改。
        NavigationStack {
            Text("Hello, World!")
                .navigationTitle($title)
                .navigationBarTitleDisplayMode(.inline)
            
            //如果你的标题在哪里，因为它代表了你的用户正在编辑某些内容的名称，我建议添加.toolvarRole(.editor)以便你的标题向其他文档标题一样与前沿对其。
                .toolbarRole(.editor)
        }
    }
}

#Preview {
    FFNavigationEdit()
}
