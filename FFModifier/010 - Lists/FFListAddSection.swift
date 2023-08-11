//
//  FFListAddSection.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/7.
//
//  如何将Section添加到List
//  SwiftUI的list视图内置了对sections和section header的支持，就像UIKit中的UITableView一样。

import SwiftUI

struct TaskRow: View {
    var body: some View {
        Text("Task data goes here")
    }
}

struct FFListAddSection: View {
    var body: some View {
        List {
            //添加header
            Section {
                TaskRow()
                TaskRow()
                TaskRow()
            } header: {
                Text("Important tasks")
            }
            
            Section {
                TaskRow()
                TaskRow()
                TaskRow()
            } header: {
                Text("Others tasks")
            }
            
            //添加footer
            Section {
                Text("Row 1")
                Text("Row 2")
                Text("Row 3")
            } footer: {
                Text("End")
            }
            
            //默认情况下，section header匹配默认的iOS样式，可以通过headerProminence()修饰符更改
            Section {
                TaskRow()
            } header: {
                Text("Header")
            }
            .headerProminence(.increased)
        }
        .listStyle(.insetGrouped)
    }
}

#Preview {
    FFListAddSection()
}
