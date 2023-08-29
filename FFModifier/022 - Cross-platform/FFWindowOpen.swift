//
//  FFWindowOpen.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/29.
//
//  如何打开新窗口
//  SwiftUI提供了一个openWindow环境密钥，可以在macOS上创建新的窗口。
//  首先，编辑App场景以包含新的Window，这意味着提供了一个窗口标题，同时也提供了一个标识符。

import SwiftUI

/**
 Window("What's New", id: "wats-new") {
     Text("New in this version...")
 }
 */

struct FFWindowOpen: View {
    @Environment(\.openWindow) var openWindow
    
    var body: some View {
        Button("Show What's New") {
            openWindow(id: "whats-new")
        }
        //也可以通过“window”菜单打开窗口，macOS将使用你提供的窗口标题自动将其显示在哪里。
    }
}

#Preview {
    FFWindowOpen()
}
