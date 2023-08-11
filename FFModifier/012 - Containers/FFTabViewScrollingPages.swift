//
//  FFTabViewScrollingPages.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/11.
//
//  SwiftUI的TabView可以当作为一个UIPageViewController，可以制作在多个屏幕间滑动的Content，底部的分页点显示具体在哪个位置。
//  要激活页面的视图样式，将.tabViewStyle()修饰符附加到TabView，传入参数.page

import SwiftUI

struct FFTabViewScrollingPages: View {
    var body: some View {
        TabView {
            Text("First")
            Text("Second")
        }
        .tabViewStyle(.page)
        //分页点是白色和半透明的白色，如果视图背景为白色，则看不到分页点
        //为了解决这个问题，可以在tabViewStyle()设置额外的修饰符来要求SwiftUI放置背景
        TabView {
            Text("First")
            Text("Second")
        }
        .tabViewStyle(.page)
        .indexViewStyle(.page(backgroundDisplayMode: .always))
        //可以通过像.page方法添加一个额外的参数来控制分页点的显示，如果不想显示分页点，可以直接传入.never
        TabView {
            Text("First")
            Text("Second")
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
    }
}

#Preview {
    FFTabViewScrollingPages()
}
