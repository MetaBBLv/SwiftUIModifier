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
        //一共绘制了五个图形，两个200*200，三个个100*50，由于各种形状的特殊性，即使使用ZStack容器，也是可以全部显示的，我这里使用的是VStack，更直观。
        //Rectangle绘制一个基本样式的矩形。
        //RoundedRectangle同样绘制的也是矩形，只不过可以将拐角按照一定的数值设置为圆角。
        //UnevenRoundedRectangle是一个圆角矩形，可以针对单个角设定为圆角。对于任何的角，默认值为0，即直角。但是可以更改值。
        //Capsule绘制一个盒子，UI更像一个胶囊，其中较短的边会完全圆化，比如定义一个100*50的图形，那么短边50就是编程圆边。
        //Ellipse绘制一个基本样式的椭圆。
        //Circle绘制一个高度和宽度相等的椭圆，即圆形。
    }
}

#Preview {
    FFShapesBuiltin()
}
