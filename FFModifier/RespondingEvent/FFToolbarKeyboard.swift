//
//  FFToolbarKeyboard.swift
//  FFModifier
//
//  Created by BBLv on 2023/7/31.
//
//  如何在键盘上添加工具栏
//  SwiftUI可以让我们在键盘上添加输入附件视图，这意味着当用户激活某些文本输入时，我们可以在哪里呈现自定义按钮。
//  这一些都是通过将toolbar()修饰符附加到应该拥有输入附件的任何视图来完成的。在创建工具栏项组时，使用.keyboard的文职将此工具栏附加到键盘上。

import SwiftUI

struct FFToolbarKeyboard: View {
    @State private var name = "Taylor"
    @State private var name1 = "BBLv"
    @FocusState var isInputActive: Bool
    
    var body: some View {
        
        List {
            TextField("Enter your name", text: $name)
                .textFieldStyle(.roundedBorder)
                .toolbar(content: {
                    ToolbarItemGroup(placement: .keyboard) {
                        Button("Click me!") {
                            print("Clicked")
                        }
                    }
                })
            
            //在实际操作中，可以利用这个功能临时关闭键盘
            TextField("Enter your name", text: $name1)
                .textFieldStyle(.roundedBorder)
                .focused($isInputActive)
                .toolbar(content: {
                    ToolbarItemGroup(placement: .keyboard) {
                        Spacer()
                        Button("Done") {
                            isInputActive = false
                        }
                    }
                })
        }
        
        
        
    
    }
}

#Preview {
    FFToolbarKeyboard()
}
