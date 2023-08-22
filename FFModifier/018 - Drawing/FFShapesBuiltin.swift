//
//  FFShapesBuiltin.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/22.
//
//  SwiftUI的内置形状（built-in）
//  SwiftUI提供了五种常用内置形状：矩形，圆角矩形，圆形，椭圆形和胶囊形状。特别是后三个，他们的行为会根据你提供的大小而有微妙的不同。

import SwiftUI

struct FFShapesBuiltin: View {
    var body: some View {
        VStack {
            //长方形
            Rectangle()
                .fill(.gray)
                .frame(width: 200, height: 200)
            //4个圆角长方形
            RoundedRectangle(cornerRadius: 25.0)
                .fill(.red)
                .frame(width: 200, height: 200)
            //可独立单独设置圆角的长方形。
            UnevenRoundedRectangle(cornerRadii: .init(topLeading: 50, topTrailing: 50))
                .fill(.orange)
                .frame(width: 200, height: 200)
            //胶囊
            Capsule()
                .fill(.green)
                .frame(width: 100, height: 50)
            //椭圆形
            Ellipse()
                .fill(.blue)
                .frame(width: 100, height: 50)
            //圆形
            Circle()
                .fill(.black)
                .frame(width: 100, height: 50)
        }
        
    }
}

#Preview {
    FFShapesBuiltin()
}
