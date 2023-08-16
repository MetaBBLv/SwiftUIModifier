//
//  FFMenuShow.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/16.
//
//  按下按钮时如何显示menu
//  SwiftUI为我们提供了一个专门的视图来显示按钮弹出时菜单。这可以通过简单的字符串或使用自定义视图创建，但无论哪种方式，你都可以发送各种按钮来控制你想要的菜单中显示的内容。
//  在macOS上，菜单会自动呈现下啦按钮。

//

import SwiftUI

struct FFMenuShow: View {
    var body: some View {
        Menu("Options") {
            Button("Order Now") {
                print("Order Now")
            }
            Button("Adjust Order") {
                print("Adjust Order")
            }
            Button("Cancel") {
                print("Cancel")
            }
        }
        //如果你愿意，你也可以在菜单中放置菜单，这将导致iOS在点击第一个选项的时候弹出第二个菜单
        Menu("Options") {
            Button("Order Now") {
                print("Order Now")
            }
            Menu("Advanced") {
                Button("Rename") {
                    print("Rename")
                }
                Button("Delay") {
                    print("Delay")
                }
            }
            Button("Adjust Order") {
                print("Adjust Order")
            }
            Button("Cancel") {
                print("Cancel")
            }
        }
        //如果你想使用一些文本和图标自定义Label
        Menu {
            Button("Order Now") {
                print("Order Now")
            }
            Button("Adjust Order") {
                print("Adjust Order")
            }
        } label: {
            Label("Options", systemImage: "paperplane")
        }
    }
}

#Preview {
    FFMenuShow()
}
