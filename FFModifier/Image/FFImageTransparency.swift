//
//  FFImageTransparency.swift
//  FFModifier
//
//  Created by BBLv on 2023/7/12.
//
// 如何使用SF Symbols获得自定义颜色和透明度
// 如果你在SwiftUIImage中使用SF Symbols，你可以使用foregroundStyle()修饰符获得单一的颜色，或者使用.renderingMode(.original)使用多色。

import SwiftUI

struct FFImageTransparency: View {
    var body: some View {
        List {
            Section {
                //分层渲染,用透明的方式绘制图像以提供额外的深度和清晰度
                Image(systemName: "theatermasks")
                    .symbolRenderingMode(.hierarchical)
                    .font(.system(size: 144))
            }
            
            Section {
                //分层渲染与前景色结合使用，可以同时指定两者
                Image(systemName: "theatermasks")
                    .symbolRenderingMode(.hierarchical)
                    .foregroundStyle(.blue)
                    .font(.system(size: 144))
            }
            
            Section {
                //.palette,完全控制图像中的颜色，全部自己指定
                Image(systemName: "shareplay")
                    .symbolRenderingMode(.palette)
                    .foregroundStyle(.blue, .black)
                    .font(.system(size: 144))
            }
            
            Section {
                //这些颜色的应用方式去决议每个单独的符号，有时符号是用2层定义的，有时是三层。
                //对于包含三种变体的符号，只需要添加额外的颜色
                Image(systemName: "person.3.sequence.fill")
                    .symbolRenderingMode(.palette)
                    .foregroundStyle(.blue, .green, .red)
                    .font(.system(size: 144))
            }
            
            Section {
                //增加渐变
                Image(systemName: "person.3.sequence.fill")
                    .symbolRenderingMode(.palette)
                    .foregroundStyle(
                        .linearGradient(colors: [.red, .black], startPoint: .top, endPoint: .bottomTrailing),
                        .linearGradient(colors: [.green, .black], startPoint: .top, endPoint: .bottomTrailing),
                        .linearGradient(colors: [.blue, .black], startPoint: .top, endPoint: .bottomTrailing)
                        
                    )
                    .font(.system(size: 144))
            }
        }
    }
}

#Preview {
    FFImageTransparency()
}
