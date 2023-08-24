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
import MetalKit

struct FFMetalShaders: View {
    let startDate = Date()
    let startDate1 = Date()
    let startDate2 = Date()
    @State private var strength = 3.0
    
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
            //着色器需要作为涂层效果来调用，它告诉SwiftUI传入整个涂层以及我们正在处理的当前像素的位置。
            Image(systemName: "figure.run.circle.fill")
                .font(.system(size: 300))
                .layerEffect(ShaderLibrary.pixellate(.float(10)), maxSampleOffset: .zero)
            //另外一种效果是使用distortionEffect()修改器激活的
            TimelineView(.animation) { context in
                Image(systemName: "figure.run.circle.fill")
                    .font(.system(size: 300))
                    .distortionEffect(ShaderLibrary.simpleWave(.float(startDate1.timeIntervalSinceNow)), maxSampleOffset: .zero)
            }
            //要使用它，同时需要使用visualEffect()和distortionEffect()
            TimelineView(.animation) { context in
                Image(systemName: "figure.run.circle.fill")
                    .font(.system(size: 300))
                    .visualEffect { content, proxy in
                        content
                            .distortionEffect(ShaderLibrary.complexWave(
                                .float(startDate2.timeIntervalSinceNow),
                                .float2(proxy.size),
                                .float(0.5),
                                .float(8),
                                .float(10)
                            ), maxSampleOffset: .zero)
                    }
            }
            //创建一个简单的浮雕过滤器，包括一个slider控制器，用户控制浮雕强度的SwiftUI
            Image(systemName: "figure.run.circle.fill")
                .foregroundStyle(.linearGradient(colors: [.orange, .red], startPoint: .top, endPoint: .bottom))
                .font(.system(size: 300))
                .layerEffect(ShaderLibrary.emboss(.float(strength)), maxSampleOffset: .zero)
            Slider(value: $strength, in: 0...20)
            //结果可得，将Metal着色器添加到SwiftUI视图中非常简单，无需大量代码即可解锁非常复杂的特效。
        }
    }
}

#Preview {
    FFMetalShaders()
}
