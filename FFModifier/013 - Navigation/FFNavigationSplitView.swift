//
//  FFNavigationSplitView.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/15.
//
//  如何创建一个两列或三列布局用NavigatinSplitView
//  SwiftUI的NavigationSplitView允许我们在更大的设备上创建多列布局（iPad macOS和大屏幕的iPhone上），但是当空间有限时，将自动折叠成NavigationStack风格的布局。
//  在最简单的形式中，你应该提供侧边栏作为它的第一个尾随闭包，你的细节视图作为他的第二个闭包。

import SwiftUI

struct FFNavigationSplitView: View {
    var body: some View {
        NavigationSplitView {
            List(1..<50) { i in
                NavigationLink("Row \(i)", value: i)
            }
            .navigationDestination(for: Int.self) {
                Text("Select row \($0)")
            }
            .navigationTitle("Split View")
        } detail: {
            Text("Please select a row")
        }
        //在该代码中，“Please select a row”文本仅在用户尚未在侧边栏中进行选择时显示，但是当用户进行选择时，它将自动被替换-navigationDestination()修饰符将自动在详细信息区域中显示其目的地视图。更棒的是，当空间有限时，你会看到整个东西被平展成一个常规的NavigationStack，这样你就可以两全其美了。
        
    }
}

#Preview {
    FFNavigationSplitView()
}
