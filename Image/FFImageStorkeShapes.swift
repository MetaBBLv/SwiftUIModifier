//
//  FFImageStorkeShapes.swift
//  FFModifier
//
//  Created by BBLv on 2023/7/11.
//
// 在iOS17中，只需要堆叠修饰符就可以同时填充和描边

import SwiftUI

struct FFImageStorkeShapes: View {
    var body: some View {
        List {
            Section {
                Circle()
                    .stroke(.red, lineWidth: 5)
                    .fill(.green)
                    .frame(width: 150, height: 150)
                
                //可以多次调用，大圈套小圈
                Circle()
                    .stroke(.blue, lineWidth: 45)
                    .stroke(.green, lineWidth: 35)
                    .stroke(.yellow, lineWidth: 25)
                    .stroke(.orange, lineWidth: 15)
                    .stroke(.red, lineWidth: 5)
                    .frame(width: 150, height: 150)
            }
            
            Section {
                //在iOS16以及更低版本中，SwiftUI提供了fill()、stroke()、strokeBorder()修饰符来调整我们绘制形状的方式，但它不提供同时填充和描边的内置方法。但是我们可以通过两种不同的方式获得相同的效果
                // 1、使用strokeBorder()在形状周围添加边框，然后使用background()将其填充形状包含在内
                Circle()
                    .strokeBorder(.red, lineWidth: 20)
                    .background(
                        Circle()
                            .fill(.orange)
                    )
                    .frame(width: 150, height: 150)
                
                //2、使用ZStack
                ZStack {
                    Circle()
                        .fill(.orange)
                    
                    Circle()
                        .strokeBorder(.red, lineWidth: 20)
                }
                .frame(width: 150, height: 150)
            }
            
            Section {
                //如果你想要填充和描边
            }
        }
    }
}

//如果您想要填充和描边大量形状，您应该考虑将此功能包装在扩展中。仅InsettableShapes获取strokeBorder()方法，因此您可能应该编写两种扩展方法 - 一种使用 处理常规形状stroke()，另一种使用 处理可插入形状strokeBorder()。
extension Shape {
    func fill<Fill: ShapeStyle, Stroke: ShapeStyle>(_ fillStyle: Fill, strokeBorder strokeStyle: Stroke, lineWidth: Double = 1) -> some View {
        self
            .stroke(strokeStyle, lineWidth: lineWidth)
            .background(self.fill(fillStyle))
    }
}

extension InsettableShape {
    func fill<Fill: ShapeStyle, Stroke: ShapeStyle>(_ fillStyle: Fill, strokeBorder strokeStyle: Stroke, lineWidth: Double = 1) -> some View {
        self
            .strokeBorder(strokeStyle, lineWidth: lineWidth)
            .background(self.fill(fillStyle))
    }
}

#Preview {
    FFImageStorkeShapes()
}
