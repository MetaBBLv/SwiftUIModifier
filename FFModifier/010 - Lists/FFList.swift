//
//  FFList.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/7.
//  什么是List？
//  SwiftUI的列表视图类似于UITableView，它可以根据你的需要显示静态的表格视图单元格。使用更加简单，不需要通过Storyboard或者在代码中register，也不需要告诉它有多少行，也不需要去手动排列和配置cell
//  相反，SwiftUI的列表是为可组合性而设计的--设计成能够从小的东西构建更大的东西。所以，SwiftUI没有一个大的视图控制器，而是通过构建小的视图，它们知道如何将自己配置为列表行。
//就代码大小而言，如果不考虑其他因素，差异是惊人的--你可以删除几乎所有的表视图代码，但仍然能得到你习惯的那种很棒的外观和感觉。

import SwiftUI

struct FFList: View {
    var body: some View {
        List {
            Text("Hello, World!")
        }
    }
}

#Preview {
    FFList()
}
