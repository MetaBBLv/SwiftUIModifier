//
//  FFTextFieldBorder.swift
//  FFModifier
//
//  Created by BBLv on 2023/7/25.
//
//  如何向文本字段添加边框
//  默认情况下，SwiftUI的TextField视图没有样式，在屏幕上表现为空白区域。通常情况下，会添加边框使其更具有辨识度

import SwiftUI

struct FFTextFieldBorder: View {
    @State private var name: String = "Tim"
    
    var body: some View {
        List {
            //给TextField添加圆角边框
            VStack(alignment: .leading) {
                TextField("输入你的名字", text: $name)
                    .textFieldStyle(.roundedBorder)
                Text("Hello, \(name)")
            }
            .frame(height: 150)
        }
    }
}

#Preview {
    FFTextFieldBorder()
}
