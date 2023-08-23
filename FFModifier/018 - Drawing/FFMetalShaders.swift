//
//  FFMetalShaders.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/23.
//  在SwiftUI视图上使用layer effects添加Metal shaders
//  SwiftUI提供了与Metal着色器的广泛集成，就在视图级别，可以以卓越的性能操纵颜色、形状等等。
//  步骤分为三步：
//  1. 用你的作色起创建一个Metal文件。着必须有一个确切的函数签名，取决于你想要应用的效果。
//  2. 创建你的SwiftUI视图，并附加一个或多个效果。
//  3. 可选的微视图添加视觉效果，一边在不改变布局的情况下读取视图的大小。


import SwiftUI
struct FFMetalShaders: View {
    let startDate = Date()
    
    var body: some View {
        ScrollView {
            Image(systemName: "figure.run.circle.fill")
                .font(.system(size: 300))
                .colorEffect(ShaderLibrary.checkerboard(.float(10), .color(.blue)))
            
            TimelineView(.animation) { context in
                Image(systemName: "figure.run.circle.fill")
                    .font(.system(size: 300))
                    .colorEffect(ShaderLibrary.noise(.float(startDate.timeIntervalSinceNow)))
            }
        }
    }
}

#Preview {
    FFMetalShaders()
}
