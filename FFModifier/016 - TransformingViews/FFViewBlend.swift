//
//  FFViewBlend.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/21.
//
//  如何将视图混合在一起
//  当将一个视图放置在另一个视图上时，你可以使用blendMode()修饰符来控制重叠的方式。这包含了多种混合颜色的方法。

import SwiftUI

struct FFViewBlend: View {
    var body: some View {
        //创建一个ZStack，里面有两个重叠的圆，将混合模式设定为.multiply,颜色会变暗
        ZStack {
            Circle()
                .fill(.red)
                .frame(width: 200, height: 200)
                .offset(x: -50)
                .blendMode(.multiply)
            Circle()
                .fill(.blue)
                .frame(width: 200, height: 200)
                .offset(x: 50)
                .blendMode(.multiply)
        }
        .frame(width: 400)
    }
}

#Preview {
    FFViewBlend()
}
