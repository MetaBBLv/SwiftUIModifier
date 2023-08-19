//
//  FFViewBorder.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/19.
//
//  如何在View周围绘制边框
//  SwiftUI为我们提供了一个专门的border()修饰符来绘制视图周围的边框。它有一些变化取决于你是否想要指定宽度和圆角半径，

import SwiftUI


struct FFViewBorder: View {
    var body: some View {
        Text("metaBBlv with Swift")
            .border(.green)
        Divider()
        //可以添加一些padding来让边框更舒服
        Text("metaBBlv with Swift")
            .padding()
            .border(.green)
        Divider()
        //设置Border的宽度
        Text("metaBBlv with Swift")
            .padding()
            .border(.red, width: 4)
        Divider()
        //添加圆角边框，使用overlay()修饰符。
        Text("metaBBlv with Swift")
            .padding()
            .overlay {
                RoundedRectangle(cornerRadius: 16)
                    .stroke(.blue, lineWidth: 4)
            }
        //对形状类型使用stroke()或strokeBorder()，对其他视图类型使用border()
    }
}

#Preview {
    FFViewBorder()
}
