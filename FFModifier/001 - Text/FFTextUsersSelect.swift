//
//  FFTextUsersSelect.swift
//  FFModifier
//
//  Created by BBLv on 2023/7/11.
// 默认情况下，swift的Text视图表示静态、不可选择的文本，但是你可以使用.textSslection()带有值的修饰符来更改它为.enabled

import SwiftUI

struct FFTextUsersSelect: View {
    var body: some View {
        List {
            // 选择文本后，用户会自动获得对常规文本操作的访问权限，例如复制和共享。然而，现在至少整个文本区域都被复制了--你没有文本选择放大镜，所以你不能截选你想要的一小部分。
            Section {
                Text("You can't touch this")
                Text("Break it down!")
                    .textSelection(.enabled)
            }
            
            Section {
                //textSelection()对任何类型的书图组进行设置都会自动使改组内的所有文本都可选择。例如，我们可以通过将修饰符添加到外层的Section组件上来使两个Text文本都可以选择copy
                
                // *注意：如果对list的section进行修饰，这个时候需要按住文本内容，点击空白处不会触发选择
                Text("You can't touch this")
                Text("Break it down!")
            }
            .textSelection(.enabled)
        }
    }
}

#Preview {
    FFTextUsersSelect()
}
