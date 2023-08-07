//
//  SwiftListListRowBackground.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/7.
//
//  如何使用listRowBackground()设置list-row的背景颜色
//  SwiftUI有一个专门的修饰符来设置list-row的背景视图，是listRowBackground。它接受任何类型的视图--包括颜色、图像和形状

import SwiftUI

struct SwiftListListRowBackground: View {
    var body: some View {
        List {
            ForEach(0..<10) {
                Text("Row \($0)")
            }
            .listRowBackground(Color.green)
        }
    }
}

#Preview {
    SwiftListListRowBackground()
}
