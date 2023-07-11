//
//  FFImageGradients.swift
//  FFModifier
//
//  Created by BBLv on 2023/7/11.
//
// SwiftUI为我们提供了多种渐变选项，所有这些选项都可以以多种方式使用

import SwiftUI

struct FFImageGradients: View {
    var body: some View {
        List {
            Section {
                //如果你是iOS16以上，则可以通过更简单的方式设置渐变
                Rectangle().fill(.blue.gradient)
                
                //对于更高级的渐变，或支持iOS16之前的版本，你可以使用SwiftUI的内置渐变类型来获得精准控制。例如：用red到blue的线性渐变来渲染文本视图
                Text("蜀道之难，难于上青天！")
                    .padding()
                    .foregroundStyle(.white)
                    .font(.largeTitle)
                    .background(
                        LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/)
                    )
                
                //颜色被指定为一个数组，你可以用更多数量的颜色构建更复杂的渐变
                Text("蜀道之难，难于上青天！")
                    .padding()
                    .foregroundStyle(.white)
                    .font(.largeTitle)
                    .background(
                        LinearGradient(gradient: Gradient(colors: [Color.red, .green, Color.blue]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/)
                    )
            }
            
            Section {
                //替代渐变样式，请尝试RadialGradient、AngularGradient,这会通过各种颜色创建径向渐变，从圆的中心一直到边缘
                Circle()
                    .fill(
                        RadialGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple]), center: .center, startRadius: 50, endRadius: 100)
                    ).frame(width: 200 ,height: 200)
            }
            
            Section {
                //创建一个角度渐变（圆锥渐变），循环显示各种颜色，返回到开头
                Circle()
                    .fill(
                        AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple, .red]), center: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    )
                    .frame(width: 200, height: 200)
            }
            
            Section {
                //由于三种渐变类型都符合ShapeStyle协议，因此你可以将它们用于背景、填充和描边
                Circle()
                    .strokeBorder(
                        AngularGradient.init(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple, .red]), center: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, startAngle: .zero, endAngle: .degrees(360)),
                        lineWidth: 30
                    )
                    .frame(width: 200, height: 200)
            }
        }
    }
}

#Preview {
    FFImageGradients()
}
