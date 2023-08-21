//
//  FFViewRotate.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/21.
//
//  如何旋转视图
//  SwiftUI的RotationEffect()修饰符让我们可以自由旋转视图，使用角度或弧度。


import SwiftUI

struct FFViewRotate: View {
    @State private var rotation = 50.0
    @State private var rotation1 = 20.0
    var body: some View {
        //将Text旋转-90度
        Text("Hello, World!")
            .rotationEffect(.degrees(-90))
        Divider()
            .padding(.top, 50)
        //使用.radians设置弧度。
        Text("Hello, World!")
            .rotationEffect(.radians(.pi))
        //使用Silder控制旋转
        Divider()
        VStack {
            Slider(value: $rotation, in: 0...360)
                .padding(.bottom, 50)
            
            Text("Hello, World!")
                .rotationEffect(.degrees(rotation))
        }
        .padding()
        //默认情况下，视图围绕其中心旋转，但如果你想固定从特定的点旋转，你可以为此添加一个额外的参数。例如，围绕左上角旋转。
        Divider()
        VStack {
            Slider(value: $rotation1, in: 0...360)
                .padding(.bottom, 50)
            
            Text("Hello, World!")
                .rotationEffect(.degrees(rotation1), anchor: .topLeading)
        }
        .padding()
    }
}

#Preview {
    FFViewRotate()
}
