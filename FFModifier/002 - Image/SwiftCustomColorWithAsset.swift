//
//  SwiftCustomColorWithAsset.swift
//  FFModifier
//
//  Created by BBLv on 2023/7/13.
//
// 如何在资产目录加载自定义颜色
// 在Assets中创建 颜色是可视化它们最好的方式，也是添加深色与浅色模式调整的简单方法（在Assets中添加color set可以同时分别设定深色与浅色模式）

import SwiftUI

struct SwiftCustomColorWithAsset: View {
    var body: some View {
        
        List {
            Section {
                Color(.customAssets)
            }
            
            Section {
                Color(.ff)
            }
        }
    }
}

#Preview {
    SwiftCustomColorWithAsset()
}
