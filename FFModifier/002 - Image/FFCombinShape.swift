//
//  FFCombinShape.swift
//  FFModifier
//
//  Created by BBLv on 2023/7/13.
//
// 如何组合图形并创建新图形
// 所有SwiftUI的图形都可以通过葛总方式组合来创建新的图形，包括并集（合并两个图形的填充区域），交集（包含两个图形中共有区域的填充区域），线交集（返回一个图形的线填充另一个）

import SwiftUI

struct FFCombinShape: View {
    var body: some View {
        
        List {
            Section {
                //将一个圆形与插入100个点的capsule组合起来，并填充为蓝色
                Circle()
                    .union(.capsule(style: .circular))
                    .fill(.blue)
                    
            }
            
            Section {
                //lineSubtraction()在圆形中切出矩形，用圆帽描边剩余部分
                Circle()
                    .lineSubtraction(.rect.inset(by: 30))
                    .stroke(style: .init(lineWidth: 20, lineCap: .round))
                    .padding()
            }
            
            Section {
                //将一个圆放在左侧，然后减去另一个向右偏移的圆
                Circle()
                    .offset(x: 0)
                    .symmetricDifference(.circle.offset(x: 100))
                    .fill(.red)
                    .frame(width: 200, height: 200)
                    .padding()
            }
        }
    }
}

#Preview {
    FFCombinShape()
}
