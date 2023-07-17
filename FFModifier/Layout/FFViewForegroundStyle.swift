//
//  FFViewForegroundStyle.swift
//  FFModifier
//
//  Created by BBLv on 2023/7/17.
//
//  如何使用forgoundStyle提供视觉结构
//  SwiftUI提供了一个foregroundStyle修饰符来共识控制文本、图像和形状的样式是指方式。foregroundStyle从最简单的形式来看，这与使用with类似.secondary，但它不仅解锁了更多的语义颜色，.tertiary而且.quaternary还增加了对任何符号ShapeStyle
import SwiftUI

struct FFViewForegroundStyle: View {
    var body: some View {
        List {
            Section {
                //使用四元样式来呈现图像和文本。
                HStack {
                    Image(systemName: "clock.fill")
                    Text("Set the time")
                }
                .font(.largeTitle.bold())
                .foregroundStyle(.quaternary)
            }
            
            Section {
                //foregroundStyle遵守ShapeStyle协议，这就意味这任何遵守ShapeStyle协议的View都可以修饰，此案例设置Hsatck的线性渐变
                HStack {
                    Image(systemName: "clock.fill")
                    Text("Set the time")
                }
                .font(.largeTitle.bold())
                .foregroundStyle(
                    .linearGradient(colors: [.red, .black], startPoint: .top, endPoint: .bottom)
                )
            }
        }
    }
}

#Preview {
    FFViewForegroundStyle()
}
