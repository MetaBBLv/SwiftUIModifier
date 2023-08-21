//
//  FFProgressViewCustomizing.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/21.
//
//  如何使用ProgressViewStyle自定义ProgressView
//  SwiftUI为我们提供了ProgressViewStyle协议来为ProgressView创建自定义设计，允许我们读取进度视图的完成情况并在我们的设计中考虑到这一点。
//  要创建自定义ProgressView样式，需要创建一个结构体，该结构体具有接受视图当前配置的makeBody()方法，然后，你可以继续渲染你想要的进度，可以时一个百分比文本，可以是一个进度圆。

import SwiftUI

//创建一个进度圆圈
struct GaugeProgressStyle: ProgressViewStyle {
    var strokeColor = Color.blue
    var strokeWidth = 25.0
    
    func makeBody(configuration: Configuration) -> some View {
        //fractionCompleted:进度视图表示的任务的完成部分，从0.0(尚未开始)到1.0(完全完成)
        let fractionCompleted = configuration.fractionCompleted ?? 0
        
        return ZStack {
            Circle()
                .trim(from: 0, to: fractionCompleted)
                .stroke(strokeColor, style: StrokeStyle(lineWidth: strokeWidth, lineCap: .round))
                .rotationEffect(.degrees(-90))
        }
    }
}

struct FFProgressViewCustomizing: View {
    @State private var progress = 0.2
    
    var body: some View {
        ProgressView(value: progress, total: 1.0)
            .progressViewStyle(GaugeProgressStyle())
            .frame(width: 200, height: 200)
            .contentShape(Rectangle())
            .onTapGesture {
                if progress < 1.0 {
                    withAnimation {
                        progress += 0.2
                    }
                }
            }
        //在-90度开始绘制，圆圈会在顶部开始绘制。
    }
}

#Preview {
    FFProgressViewCustomizing()
}
