//
//  FFButtonsBordered.swift
//  FFModifier
//
//  Created by BBLv on 2023/7/24.
//
//  如何设置Button的边框
//  SwiftUI具有专用的.bordered按钮样式，模仿许多Apple应用程序中使用的常见外观和感觉

import SwiftUI

struct FFButtonsBordered: View {
    var body: some View {
        List {
            //基础样式
            Button("Buy: $0.99") {
                print("Buying....")
            }
            .buttonStyle(.bordered)
            
            //.borderedProminent 颜色更鲜明
            Button("But: $993") {
                print("Buying./....")
            }
            .buttonStyle(.borderedProminent)
            
            //.tint添加颜色
            Button("Submit") {
                print("Buying./....")
            }
            .tint(.indigo)
            .buttonStyle(.borderedProminent)
            
            // .role设置
            Button("Delete", role: .destructive) {
                print("Buying./....")
            }
            .buttonStyle(.borderedProminent)
        }
    }
}

#Preview {
    FFButtonsBordered()
}
