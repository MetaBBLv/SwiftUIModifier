//
//  FFListSeparator.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/8.
//
//  如何调整list行分隔符的可见性和颜色
//  SwiftUI提供了两个修饰符来控制其列表中行分隔符的外观，特别是listRowSeparator()用于控制行分隔符是否可见，listRpwSeparator()用于控制分隔符的颜色。

import SwiftUI

struct FFListSeparator: View {
    var body: some View {
        //隐藏行分隔符
        List {
            ForEach(1..<100) { index in
                Text("Row \(index)")
                    .listRowSeparator(.hidden)
            }
        }
        //设置分隔符颜色
        List {
            ForEach(1..<100) { index in
                Text("Row \(index)")
                    .listRowSeparatorTint(.red)
            }
        }
    }
}

#Preview {
    FFListSeparator()
}
