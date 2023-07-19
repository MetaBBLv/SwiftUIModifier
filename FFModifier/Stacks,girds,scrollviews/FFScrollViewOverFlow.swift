//
//  FFScrollViewOverFlow.swift
//  FFModifier
//
//  Created by BBLv on 2023/7/19.
//
//  如何禁用ScrollView 剪切以是内存溢出
//  SwiftUI的ScrollView自动剪辑其内容，以不安滚动视图始终完全保留在滚动视图区域内。但是，如果使用scrollClipDisabled()修饰符，则可以覆盖次默认行为，从而允许滚动视图溢出
//  重要提示：这不会影响滚动视图的触摸区域，因此如果用户点击超出ScrollView的视图，则点击实际上会被下面的任何内容接受到。因此，最好稍微限制一下，例如允许阴影在滚动区域之外流动，而不会果冻影响其他视图。


import SwiftUI

struct FFScrollViewOverFlow: View {
    var body: some View {
        //作为事例，显示了一个顶部和底部都具有固定文本，中间有滚动区域的VStack。ScrollView将在顶部文本下方整齐的对齐，当你滚动时，就会溢出
        VStack {
            Text("Fixed at the top")
                .frame(maxWidth: .infinity)
                .frame(height: 100)
                .background(.green)
                .foregroundStyle(.white)
            
            ScrollView {
                ForEach(0..<5) { i in
                    Text("Scrolling")
                        .frame(maxWidth:.infinity)
                        .frame(height:200)
                        .background(.orange)
                        .foregroundStyle(.white)
                }
            }
            .scrollClipDisabled()
            Text("Fixed at the bottom")
                .frame(maxWidth: .infinity)
                .frame(height: 100)
                .background(.green)
                .foregroundStyle(.white)
        }
        
        /**使用scrollSlipDisabled()时，有两点注意：
         1、你可以添加自定义剪辑形状来限制内容溢出的距离。例如，添加padding()然后添加ClipShape(.rect)意味着你会得到一点溢出，但不是无限的
         2、由于scrollVIew现在与周围环境重叠，因此你可能需要使用zIndex()来调整其垂直位置。例如，如果其他视图具有哦默认的Z索引，则在滚动视图上使用zIndex(1)将其选在在其他视图上*/
        
        
    }
}

#Preview {
    FFScrollViewOverFlow()
}
