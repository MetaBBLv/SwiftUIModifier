//
//  FFStackSpacingAndAlignment.swift
//  FFModifier
//
//  Created by BBLv on 2023/7/18.
//
// 如何通过alignment和spacing自定义stack布局

import SwiftUI

struct FFStackSpacingAndAlignment: View {
    var body: some View {
        List {
            //内间距
            VStack(spacing: 20, content: {
                Text("Hi")
                Text("Swift UI")
            })
            
            //添加分割线
            VStack {
                Text("Hi")
                Divider()
                Text("Swift UI")
            }
            
            //默认情况下，stack中的View居中对齐，在HStack的情况下，这意味着项目在中间垂直对齐，因此如果你有两个不同高度的Text，它们都会与垂直中心对齐。对于VStack，意味着View在中间水平对齐，因此如果你有两个不同长度的Text视图，它们都会中心对齐
            
            //如果要调整是指，在创建stack时加入alignment参数
            VStack(alignment: .leading, content: {
                Text("Hi")
                Text("Swift UI")
            })
            
            //同时设置alignment与spacing
            VStack(alignment: .leading, spacing: 20, content: {
                Text("Hi")
                Text("Swift UI")
            })
        }
    }
}

#Preview {
    FFStackSpacingAndAlignment()
}
