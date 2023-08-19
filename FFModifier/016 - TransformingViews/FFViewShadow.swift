//
//  FFViewShadow.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/19.
//
//  如何在View周围绘制阴影
//  SwiftUI给了我们两种创建阴影的方式：
//  直接阴影附加到形状样式上
//  使用shadow修饰符绘制阴影。

import SwiftUI

struct FFViewShadow: View {
    var body: some View {
        Circle()
            .fill(.red.shadow(.drop(color: .black, radius: 10)))
            .padding()
        //创建内部阴影
        Circle()
            .fill(.green.shadow(.inner(color: .black ,radius: 10)))
            .padding()
        //你可以控制阴影的颜色、半径、和位置，还可以通过调整修饰符的顺序来控制视图的那些部分为阴影。
        //如果你希望将阴影附加到其他类型视图上，则应该使用shadow()xiushifu ,在其基本形式中，你可以通过指定模糊半径来添加阴影。
        Text("metaBBLv with Swift")
            .foregroundStyle(.black)
            .padding()
            .shadow(radius: 5)
            .border(.red, width: 4)
            .background(.white)
        //这添加了非常轻微的阴影，在文本中心5点模糊。
        //你还可以指定你想要的颜色以及与原始视图X和Y的偏移量。例如，浙江创建一个带有5点模糊的强烈红色阴影，以文本为中心。
        Text("metaBBLv with Swift")
            .padding()
            .shadow(color: .red, radius: 5)
            .border(.red, width: 4)
        //如果你想为阴影指定偏移量，添加x、y
        Text("metaBBLv with Swift")
            .padding()
            .shadow(color: .red, radius: 5, x: 20, y: 20)
            .border(.red, width: 4)
        //SwiftUI按照你列出的顺序使用修饰符，所以你想让你的阴影也应用到边框上，只要把边框修饰符放在阴影之前。
        Text("metaBBLv with Swift")
            .padding()
            .border(.red, width: 4)
            .shadow(color: .red, radius: 5, x: 20, y: 20)
        //如果你发现你阴影效果不够强，添加另一个shadow()修饰符，你可以把她们叠加起来创建更复杂的阴影效果。
    }
}

#Preview {
    FFViewShadow()
}
