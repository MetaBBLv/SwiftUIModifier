//
//  FFBarsBackground.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/11.
//
//  如何自定义Navigationbar、tabbar、toolbars的背景色
//  SwiftUI的toolbarBackground()修饰符可以自定义工具来在app中的外观，根据需求控制NavigationStack、TabView和其他toolbar样式。

import SwiftUI

struct FFBarsBackground: View {
    var body: some View {
        //显示包含100行的list，导航栏背景为蓝绿色
        TabView {
            NavigationStack {
                List(0..<100) {
                    Text("Row \($0)")
                }
                .navigationTitle("100 Rows")
                .toolbarBackground(.teal, for: .navigationBar)
            }
            .tabItem {
                Label("First", systemImage: "1.circle")
            }
            //在这里选择的背景值在系统认为必要时使用，而不是总是可见的。因此，在上面的代码中，navigationbar开始是没有颜色的，滚动后会改变。
            //如果你希望为一个或两个栏类型着色，或者希望为每个栏提供不同的样式，则可以向toolbarBackground提供第二个参数以获得外的控制。
            NavigationStack {
                List(0..<100) {
                    Text("Row \($0)")
                }
                .navigationTitle("100 Rows")
                .toolbarBackground(.orange, for: .navigationBar, .tabBar)
            }
            .tabItem {
                Label("Second", systemImage: "list.bullet")
            }
            //这个修饰符还有一个重要用途：可以要求系统完全隐藏背景，而不是指定背景颜色
            NavigationStack {
                List(0..<100) {
                    Text("Row-Third \($0)")
                }
                .navigationTitle("100 Rows")
                .toolbarBackground(.hidden)
            }
            .tabItem {
                Label("Third", systemImage: "list.bullet")
            }
            //在该示例中，当滚动时，列表内容直接出现在导航标题上。如果采用这种方法，请确保你的主要内容与toolbar重叠时不会发生UI问题。
        }
        
    }
}

#Preview {
    FFBarsBackground()
}
