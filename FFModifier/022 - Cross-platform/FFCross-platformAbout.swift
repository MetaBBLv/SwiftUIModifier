//
//  FFCross-platformAbout.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/28.
//
//  关于SwiftUI的跨平台
//  当苹果宣布SwiftUI时，他们做了一个重要的区别：SwiftUI不是一个多平台框架，而是一个在多个平台上创建App的框架。
//  这看起来像是用两种不同的方式表达同一件事，但实际上这意味着SwiftUI的许多部分在iOS上可以使用，但在macOS上不可用。
//  应用程序的核心保持不变：模型、网络和大部分用户界面。但要获得好用的App（构建真正适合每个Apple平台的应用程序），需要添加一些特定于平台的增强功能。你的应用程序如何在watchOS上如何使用Digital Crown？tvOS上播放/暂停按钮怎么样？或者macOS上的右键菜单？
//  如何将这些问题有效的解决是构建多平台体验的关键。

import SwiftUI

struct FFCross_platformAbout: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    FFCross_platformAbout()
}
