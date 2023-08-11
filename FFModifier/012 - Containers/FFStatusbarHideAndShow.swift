//
//  FFStatusbarHideAndShow.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/11.
//
//  如何隐藏和显示状态栏
//  我们可以使用SwiftUI的StatusBar()修饰符隐藏和显示iOS状态栏。它接受一个掩藏参数，该参数必须为true或false，取决于你的需求

import SwiftUI

struct FFStatusbarHideAndShow: View {
    @State private var hideStatusBar = false
    
    var body: some View {
        //此修饰符仅在iOS上可用
        Text("No status bar, Please")
            .statusBar(hidden: false)
        //如果你希望状态栏可见性依赖于某些程序状态，使用@state来代替hard-coded。例如，创建一个hideStatusBar的bool值，当按钮被点击时，该bool值会被切换，从而控制状态栏是否显示。
        Button("Toggle Status Bar") {
            withAnimation {
                hideStatusBar.toggle()
            }
        }
        .statusBar(hidden: hideStatusBar)
        
        //此case由于示例，Text与Button同时设定了statusBar，想要看到Button点击的动态效果，将18行代码注释掉，有干扰。
    }
}

#Preview {
    FFStatusbarHideAndShow()
}
