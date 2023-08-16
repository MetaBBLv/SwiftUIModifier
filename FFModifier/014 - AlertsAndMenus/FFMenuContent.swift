//
//  FFMenuContent.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/16.
//
//  创建显示context的menu
//  SwiftUI为我们提供了ContextMenu修饰符，用于在app中创建弹出式菜单。在iOS中，这通常是长按触发的，但它的工作原理与macOS上的右键一样。
//  contextMenu是由椅子按钮组成的，每个按钮都有自己的动作、文本和图标。文本和图标可以直接在按钮中设置。因为SwiftUI将提供一个隐式的HStack来确保他们符合系统标准的外观和感觉。
//  所以，如果我们想要一个上下文menu附加到一些文本上，我们可以为菜单提供两个按钮。

import SwiftUI

struct FFMenuContent: View {
    var body: some View {
        Text("Options")
            .contextMenu(ContextMenu(menuItems: {
                Button {
                    print("Change country setting")
                } label: {
                    Label("Choose Country", systemImage: "globe")
                }
                
                Button(action: {
                    print("Enable geolocation")
                }, label: {
                    Label("Detect Location", systemImage: "location.circle")
                })
            }))
        //要在iOS上尝试一下，长按“Options”文本弹出来的菜单，或者在macOS上右键。此修饰符可以附加到任何SwiftUI视图。
    }
}

#Preview {
    FFMenuContent()
}
