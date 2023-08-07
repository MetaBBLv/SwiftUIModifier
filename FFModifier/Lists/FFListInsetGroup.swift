//
//  FFListInsetGroup.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/7.
//
//  如何创建分组和插入分组列表
//  SwiftUI的列表视图有一个listStyle()修饰符来控制list的样式，grouped来获得old-style分组，.insetgrouped获得newer-style的分组

import SwiftUI

struct ExampleRow: View {
    var body: some View {
        Text("Example Row")
    }
}

struct FFListInsetGroup: View {
    var body: some View {
        //.grouped
        List {
            Section {
                ExampleRow()
                ExampleRow()
                ExampleRow()
            } header: {
                Text("Examples")
            }
        }
        .listStyle(.grouped)
        
        //insetGrouped
        List(0..<100) { i in
            Text("Row \(i)")
        }
        .listStyle(.insetGrouped)
    }
}

#Preview {
    FFListInsetGroup()
}
