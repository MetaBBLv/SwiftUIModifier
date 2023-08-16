//
//  FFNavigation.swift
//  FFModifier
//
//  Created by 小B同学 on 2023/8/13.
//
//  Navigation描述

/**导航是许多应用程序的核心，SwiftUI的简单、易用的方面在Navigation上做的非常好，这意味着使用NavigationLink、使用NavigationPath完全控制导航，使用NavigationSplitcView支持第二视图和第三视图布局等。
这意味着很多时候可以忽略Navigation相关的场景，因为非常简单，专注于需要更多思考的部分，例如：
- 制作具有合理默认值的可自定义的toolbar
- 通过状态恢复保存和加载用户的导航
- 决定如何显示侧边栏，或在需要时添加额外的Content视图
- 结合NavigationSplitView和NavigationStack获得想要的结构
 */

import SwiftUI

struct FFNavigation: View {
    var body: some View {
        NavigationStack {
            List {
                NavigationLink("最简单的Navigation") {
                    Text("So easy")
                }
            }
            .navigationTitle("Navigation")
        }
    }
}

#Preview {
    FFNavigation()
}
