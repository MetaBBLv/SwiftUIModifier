//
//  FFDisableTaps.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/3.
//
//  如何使用allowsHitTexting()禁用视图的点击
//  SwiftUI可以使用allowedHitTesting()修饰符阻止视图接收任何类型的点击。如果视图不允许进行命中测试，则任何点击都会自动继续穿过测图，到达其后面的任何内容。
import SwiftUI

struct FFDisableTaps: View {
    var body: some View {
        ZStack {
            Button("Tap me") {
                print("Button was tapped")
            }
            .frame(width: 100, height: 100)
            .background(.gray)
            
            Rectangle()
                .fill(.green.opacity(0.2))
                .frame(width: 300, height: 300)
                .clipShape(Circle())
                .allowsHitTesting(false)
        }
        //尽管矩形位于按钮的上面，但它设置了allowsTightening(false)-矩形上的任何点击都不会被矩形捕获，而是传递到下面的按钮。
        //当你想要用另外一个视图突出显示一个视图时，这种效果非常有用-上面的绿色圆圈可能时点击此处开始的教程的一部分，如果圆圈本身抓住了点击，则该效果将不起作用
    }
}

#Preview {
    FFDisableTaps()
}
