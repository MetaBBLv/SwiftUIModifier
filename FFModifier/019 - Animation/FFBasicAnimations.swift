//
//  FFBasicAnimations.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/25.
//
//  如何创建基本动画
//  SwiftUI通过animation()修饰符内置了对动画的支持。要使用此修饰符，请将其放置在视图的任何其他修饰符之后，告诉他你想要的动画类型，并确保将其附加到特定的值，以便仅在该特定值更改时触发动画

import SwiftUI

struct FFBasicAnimations: View {
    @State private var scale = 1.0
    @State private var scale2 = 1.0
    @State private var angle = 0.0
    @State private var borderThickness = 1.0
    
    var body: some View {
        //例如，创建一个Button，每次点击，缩放+1
        
        Button("Press here") {
            scale += 1
        }
        .scaleEffect(scale)
        .animation(.linear(duration: 1), value: scale)
        Divider()
        //动画的发生时间是1s，但如果你不想为动画指定精确的时间，可以使用.linear
        //重要提示：从iOS17以及更高版本以后，SwiftUI使用spring动画，在此之前默认动画是线性动画
        //除了简单的线性动画，还可以在各种内置选项中指定曲线：
        //.easein开始缓慢，然后加速，直到结束
        //.easeout还是很快，接近结束时减速，直到结束
        //.easeinout开始很慢，在中间加速，然后在接近结束时减速
        //.smooth是一个没有弹跳的spring动画（iOS17）
        //.snappy是一个带有小弹跳的spring动画（iOS17）
        //.bouncy是一个有中等弹跳的spring动画（iOS17）
        //或者，可以通过指定.timingCurve来控制point
        
        //例如，创建缩放效果动画，开始缓慢，然后变得快速
        Button("Prese here") {
            scale2 += 1
        }
        .scaleEffect(scale2)
        .animation(.easeIn, value: scale)
        Divider()
        //还有其他很多动画修饰符，比如2D和3D旋转，不透明度，边框等
        //创建一个按钮以及旋转动画，添加border,随着动画宽度+1
        Button("Press here") {
            angle += 45
            borderThickness += 1
        }
        .padding()
        .border(.red, width: borderThickness)
        .rotationEffect(.degrees(angle))
        .animation(.easeIn, value: angle)
        
    }
}

#Preview {
    FFBasicAnimations()
}
