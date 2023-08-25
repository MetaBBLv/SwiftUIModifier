//
//  FFAnimationSpring.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/25.
//  如何创建Spring Animation
//  SwiftUI内置了对spring动画的支持，这些动画会移动到目标点，然后反弹回来，简言之就是个弹性动画。
//  如果只使用.spring()本身，不带参数，则会得到一个合理的默认值。

import SwiftUI

struct FFAnimationSpring: View {
    @State private var angle: Double = 0.0
    @State private var angle2: Double = 0.0
    @State private var scaless = 1.0
        
    var body: some View {
        //创建一个弹簧动画，每次点击将其旋转45度
        Button("Press here") {
            angle += 45
        }
        .padding()
        .rotationEffect(.degrees(angle))
        .animation(.spring, value: angle)
        //如果你希望对spring动画进行颗粒度控制，可以添加参数：
        //如果需要支持iOS16以及更早版本，需要指定物体的质量，弹簧的硬度，弹性减缓速度，以及在启动时开始移动的速度。
        //如果只需要支持iOS17以及以后，可以指定想要的弹力持续的时间，还可以选择添加想要的弹力和混合效果。
        Button("Press here") {
            angle2 += 45
        }
        .padding()
        .rotationEffect(.degrees(angle2))
        .animation(.interpolatingSpring(mass: 1,stiffness: 1, damping: 0.5, initialVelocity: 10), value: angle2)
        //注意：这是一个插值弹簧，这意味着如果出发了几次动画，弹簧效果会随着弹簧的结合而变得越来越强
        //这段代码或多或少做相同的事情，使用与iOS17以及跟高版本兼容
        
        Button("Press here") {
            scaless += 1
        }
        .padding()
        .scaleEffect(scaless)
        .animation(.spring(duration: 1, bounce: 0.75), value: scaless)
    }
}

#Preview {
    FFAnimationSpring()
}
