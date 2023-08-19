//
//  FFViewBorderInside.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/19.
//
//  如何在视图中绘制border
//  SwiftUI为我们提供了stroke()和strokeBorder()修饰符，用于在形状周围绘制border，略有不同：
//  strokeBorder()修饰符将视图插入边框高度的一半，然后应用边框，这意味着整个边框都在视图内绘制。
//  stroke(0修饰符以视图的边缘为中心绘制border，这意味着一半的border在视图内部，一半在外部。
//  重要提示：这两个修饰符只适用于形状（Circle、Rectangle、Capsule等视图），不能对Text、Image等其他非形状视图使用。如果你想在非形状视图周围绘制边框，使用border修饰符

import SwiftUI

struct FFViewBorderInside: View {
    var body: some View {
        Circle()
            .strokeBorder(Color.blue, lineWidth:  50)
            .frame(width: 200, height: 200)
            .padding()
        //因为使用了strokeBorder(),所以50宽度的边框全部在圆的内部
        Divider()
        Circle()
            .stroke(.green, lineWidth: 50)
            .frame(width: 200, height: 200)
            .padding()
    }
}

#Preview {
    FFViewBorderInside()
}
