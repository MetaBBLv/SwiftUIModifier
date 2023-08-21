//
//  FFButtonStyle.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/21.
//
//  使用ButtonStyle自定义按钮
//  SwiftUI有很多样式协议，允许我们为视图定义通用的样式，比如Button、ProgressView、Toggle等。他们的工作原理都是允许我们集中的使用任意数量的修饰符，使视图看起来像我们想要的那样。创建一个控件其实就是一套完整的自定义修饰符的集合。

import SwiftUI

//可以将常规的三个修饰符集中到一个单一的BlueButton样式中
struct BlueButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color(red: 0, green: 0, blue: 0.5))
            .foregroundStyle(.white)
            .clipShape(Capsule())
        
    }
}

//创建按钮点击时放大效果
struct GrowingButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(.green)
            .foregroundStyle(.white)
            .clipShape(Capsule())
            .scaleEffect(configuration.isPressed ? 1.2 : 1.0)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}


struct FFButtonStyle: View {
    var body: some View {
        Button("Press Me") {
            print("Button pressed!")
        }
        .padding()
        .background(Color(red: 0, green: 0, blue: 0.5))
        .clipShape(Capsule())
        
        //将修饰符包装在BlueButton中了，相当于高度集成。
        Button("Press Me") {
            print("Button pressed!")
        }
        .buttonStyle(BlueButton())
        
        Button("Press Me") {
            print("Button pressed!")
        }
        .buttonStyle(GrowingButton())
    }
}

#Preview {
    FFButtonStyle()
}
