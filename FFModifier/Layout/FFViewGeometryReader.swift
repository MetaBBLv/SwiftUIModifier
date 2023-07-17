//
//  FFViewGeometryReader.swift
//  FFModifier
//
//  Created by BBLv on 2023/7/17.
//
// 如何使用GeometryReader提供相对尺寸
// 在SwiftUI中，最好的选择是让系统自己自动布局，但也可以使用GeometryReader ，例如你希望两个View占据屏幕上可用宽度的一半，如果使用硬编码是不可能的，因为我事先不知道屏幕宽度是多少，为了解决这个问题GeometryReader为我们提供了一个输入值，告诉我们可以使用的宽度和高度，然后我们可以将其用于我们的任何计算。
import SwiftUI

struct FFViewGeometryReader: View {
    var body: some View {
        //实例：我现在创建两个视图，希望其中一个占据父视图的1/3，另一个占据2/3
        List {
            // 注意：GeometryReader不考虑视图层次结构中进一步向下的任何便宜或艰巨，这就是为什么要设置Hstack间距为0，如果有间距，则视图对于可用空间就会大了。通过GeometryReader设置的就超出了原本视图frame
            GeometryReader(content: { geometry in
                HStack(spacing: 0, content: {
                    Text("Left")
                        .font(.largeTitle)
                        .foregroundStyle(.black)
                        .frame(width: geometry.size.width * 0.33)
                        .background(.yellow)
                    Text("Right")
                        .font(.largeTitle)
                        .foregroundStyle(.black)
                        .frame(width: geometry.size.width * 0.67)
                        .background(.orange)
                })
            })
            .frame(height: 50)
        }
    }
}

#Preview {
    FFViewGeometryReader()
}
