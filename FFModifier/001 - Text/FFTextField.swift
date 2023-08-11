//
//  FFTextField.swift
//  FFModifier
//
//  Created by BBLv on 2023/7/10.
//
// SwiftUI的TextField视图通常允许用户以他们想要的任何大小写的形式编辑内容，但如果你想控制它，你可以使用修饰符来强制使用大写或者小写textCase()

import SwiftUI

struct FFTextField: View {
    @State private var name = "Paul"
    var body: some View {
        
        List() {
            Section {
                // 将用户输入的名字每个字母改成大写字母
                TextField("Shout your name at me", text: $name)
                    .textFieldStyle(.roundedBorder)
                    .textCase(.uppercase)
                    .padding(.horizontal)
            }
        }
    }
}

#Preview {
    FFTextField()
}
