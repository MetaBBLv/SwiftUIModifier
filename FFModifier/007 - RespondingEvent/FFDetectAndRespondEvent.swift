//
//  FFDetectAndRespondEvent.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/2.
//
//  如何检测并响应按键事件
//  SwiftUI有一个onKeyPress()修饰符，可以让我们响应应用程序中出发的硬件键盘事件，唯一的问题时你正在观看按键的视图当前必须具有输入焦点。
//  根据你的需要，监视按键可以采取多种形式，但无论采取哪种方法，你的视图都必须时可聚焦的，以便响应按键。因此，此代码将文本视图标记为可聚焦且当前已聚焦，然后每当按下键时更细内容：

import SwiftUI

struct FFDetectAndRespondEvent: View {
    @FocusState private var focused: Bool
    @State private var key = ""
    
    var body: some View {
        //return .handler部分告诉SwiftUI完全响应按键操作的闭包。如果你发挥.ignored，则按键操作将被传递到接下来能处理它的任何视图。
        Text(key)
            .focusable()
            .focused($focused)
            .onKeyPress { press in
                key += press.characters
                return .handled
            }
            .onAppear {
                focused  = true
            }
        //注意：我们收到的字符没有附加任何修饰键，因此不会为你提供大写字母或者特殊符号内容。
        //其他形式的onKeyPress()包括跟踪那个阶段被触发的形式，因此你可以使用此代码仅跟踪何时释放按键。
        Text(key)
            .onKeyPress(phases: .up) { press in
                print("Received \(press.characters)")
                return .handled
            }
        //响应按下的某些类型按键,characters: .alphanumerics 指定了只响应字母和数字字符的按键事件。这意味着只有当用户按下字母或数字键时，处理程序才会被触发。
        Text(key)
            .onKeyPress(characters: .alphanumerics) { press in
                print("Received \(press.characters)")
                return .handled
            }
        //响应特定字符:当按下空格、w、q时触发
        Text(key)
            .onKeyPress(keys: [.escape, "w", "q"]) { press in
                print("Received \(press.characters)")
                return .handled
            }
    }
}

#Preview {
    FFDetectAndRespondEvent()
}
