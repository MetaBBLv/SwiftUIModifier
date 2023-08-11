//
//  FFGroupView.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/11.
//
//  如何将视图分组
//  如果需要几个视图作为一个整体--例如，一起转换，那么可以使用SwiftUI的Group视图，这一点尤其重要，因为由于潜在技术原因，一次最多向父视图添加10个视图

import SwiftUI

struct FFGroupView: View {
    var body: some View {
        //包含10个Text的Stack,当添加了11个视图的时候就会报错（Extra argument in call）
        //得到的错误是对成员“buildBlock()”的模糊引用。
        VStack {
            Text("Line 1")
            Text("Line 2")
            Text("Line 3")
            Text("Line 4")
            Text("Line 5")
            Text("Line 6")
            Text("Line 7")
            Text("Line 8")
            Text("Line 9")
            Text("Line 0")
        }
        Divider()
        //这是因为SwiftUI的视图构建系统有各种各样的代码，可以添加1-10个视图，但不能添加第11个视图，但是，可以使用Group
        VStack {
            Group {
                Text("Line 1")
                Text("Line 2")
                Text("Line 3")
                Text("Line 4")
                Text("Line 5")
                Text("Line 6")
            }
            
            Group {
                Text("Line 7")
                Text("Line 8")
                Text("Line 9")
                Text("Line 0")
                Text("Line 11")
            }
        }
        //这种情况下就巧妙的绕过了10个视图的限制，因为这个时候VStack只包含了两个Group
    }
}

#Preview {
    FFGroupView()
}
