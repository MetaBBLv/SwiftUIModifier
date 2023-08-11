//
//  FFViewCustomLayout.swift
//  FFModifier
//
//  Created by BBLv on 2023/7/17.
//
// 如何设置一个View的自定义frame
// 默认情况下，SwiftUI的视图仅占用所需的空间，但如果更改，可以使用frame()来控制

import SwiftUI

struct FFViewCustomLayout: View {
    var body: some View {
        
        List {
            Section {
                // 创建一个最大宽高200*200的BUtton
                Button {
                    print("Button tapped")
                } label: {
                    Text("Welcome")
                        .frame(minWidth: 0, maxWidth: 200, minHeight: 0, maxHeight: 200)
                        .font(.largeTitle)
                }
                .background(.black)
            }
            
            Section {
                //指定View的最小宽度和最小高度，最大宽度和高度为无穷大，是文本视图填充整个cell
                Text("蜀道难，难于上青天！")
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                    .background(.red)
            }
        }
    }
}

#Preview {
    FFViewCustomLayout()
}
