//
//  FFListSelectionRow.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/8.
//
//  SwiftUI的list支持多选，但仅限于编辑模式之下。为了支持多选，首先添加一个与列表中使用的类型相同的可选属性集合。例如，如果一个整数list，那么将有一个可选的Int。使用他的选择参数将它传递给list，确保list处于编辑模式。

import SwiftUI

struct FFListSelectionRow: View {
    @State private var selection = Set<String>()
    let names = ["BBLv", "Cyril", "Lana", "Mallory", "Sterling"]
    
    var body: some View {
        NavigationStack {
            List(names, id: \.self, selection: $selection) { name in
                Text(name)
            }
            .navigationTitle("List Selection")
            .toolbar {
                EditButton()
            }
        }
    }
}

#Preview {
    FFListSelectionRow()
}
