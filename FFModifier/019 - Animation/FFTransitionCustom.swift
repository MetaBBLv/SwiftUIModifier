//
//  FFTransitionCustom.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/25.
//
//  虽然SwiftUI自带了一些列的转场动画，也可以自定义transition
//  这个过程分为三个步骤：
//  1. 创建一个ViewModifier来表示转换的任何状态
//  2. 创建一个AnyTransition扩展，该扩展使用活动状态和标识状态的视图修饰符
//  3. 使用transition()修饰符将动画应用到视图上

import SwiftUI

//例如，编写一个形状和视图修饰符组合，模仿Keynote中的虹膜动画
//1. 定义一个ScaledCircle形状，它在一个巨型哪创建一个圆，该矩形根据一些可动画化的数据进行缩放。
//2. 创建一个自定义ViewModifier结构体，将任何形状（缩放后的圆）应用于另一个视图的剪辑形状。
//3. 在其包装在AnyTransition扩展中，以便将该修饰符包装在transition中，以便于调用。

struct ScaledCircle: Shape {
    //控制绘制矩形内圆的大小。但为0时，圆不可见，当为1时，圆填充矩形
    var animatableData: Double
    
    func path(in rect: CGRect) -> Path {
        let maximumCircleRadius = sqrt(rect.width * rect.width + rect.height * rect.height)
        let circleRadius = maximumCircleRadius * animatableData
        
        let x = rect.midX - circleRadius / 2
        let y = rect.midY - circleRadius / 2
        
        let circleRect = CGRect(x: x, y: y, width: circleRadius, height: circleRadius)
        
        return Circle().path(in: circleRect)
    }
}

//通用修饰符，可以剪辑任何形状的视图。
struct ClipShapeModifier<T: Shape>: ViewModifier {
    let shape: T
    
    func body(content: Content) -> some View {
        content.clipShape(shape)
    }
}

//结合ScaledCircle和ClipShapeModifier的自定义transition
extension AnyTransition {
    static var iris: AnyTransition {
        .modifier(
            active: ClipShapeModifier(shape: ScaledCircle(animatableData: 0)),
            identity: ClipShapeModifier(shape: ScaledCircle(animatableData: 1)))
    }
}

//使用自定义transition
struct FFTransitionCustom: View {
    @State private var isShowingRed = false

    var body: some View {
        ZStack {
            Color.blue
                .frame(width: 200, height: 200)

            if isShowingRed {
                Color.red
                    .frame(width: 200, height: 200)
                    .transition(.iris)
                    .zIndex(1)
            }
        }
        .padding(50)
        .onTapGesture {
            withAnimation(.easeInOut) {
                isShowingRed.toggle()
            }
        }
    }
}

#Preview {
    FFTransitionCustom()
}
