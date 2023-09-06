//
//  FFPropertyWrapperFocusState.swift
//  FFModifier
//
//  Created by BBLv on 2023/9/6.
//
//  什么是@FocusState
//SwiftUI提供了一个特定的属性包装器来跟踪当前接受用户输入的视图，成为@FocusState。这可以绑定到一个Bool值以控制单个字段，或绑定到一个枚举以在多个字段之间进行控制。


import SwiftUI

//控制单个输入字段是否具有键盘焦点
struct FFPropertyWrapperFocusState: View {
    @FocusState private var isUsernameFocused: Bool
    @State private var username = "meta BBLv"
    
    var body: some View {
        VStack {
            TextField("输入你的用户名", text: $username)
                .focused($isUsernameFocused)
            
            Button("切换焦点") {
                isUsernameFocused.toggle()
            }
        }
    }
}

#Preview {
    FFPropertyWrapperFocusState()
}
