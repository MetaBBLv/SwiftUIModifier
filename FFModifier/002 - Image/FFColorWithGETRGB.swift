//
//  FFColorWithGETRGB.swift
//  FFModifier
//
//  Created by BBLv on 2023/7/13.
//
// 如何从颜色中读取红、绿、蓝的值
// SwiftUI的Color视图并不是保留一种特定的颜色，而是在屏幕上绘制时才解析为特定值。这允许系统使用明暗模式之间的细微变化来确保最佳，但这也意味着获得市级的红绿蓝分别是什么的唯一方法是询问解析的颜色。
// 如何解决：1、获取当前环境的访问权限，并将其传递到对你的颜色调用函数resolve(in:).Codable。2、保存数据

import SwiftUI

struct FFColorWithGETRGB: View {
    @Environment(\.self) var environment
    @State private var color = Color.red
    
    @State private var resolvedColor: Color.Resolved?
    @State private var colorJSON = ""
    
    var body: some View {
        
        List {
            Section {
                // 通过用户选择的颜色，获取红绿蓝分量
                // 注意：RGB分量的数据格式为Float，而不是double
                ColorPicker("Select your favorite color", selection: $color)
                    .onChange(of: color, initial: true, getColor)
                
                if let resolvedColor {
                    Text("Red: \(resolvedColor.red)")
                    Text("Green: \(resolvedColor.green)")
                    Text("Blue: \(resolvedColor.blue)")
                    Text("Opacity: \(resolvedColor.opacity)")
                }
            }
            
            Section {
                // 将颜色数据解析为json
                ColorPicker("Select your favorite color", selection: $color)
                    .onChange(of: color, initial: true, getColor)
                
                if let resolvedColor {
                    Text("Red: \(resolvedColor.red)")
                    Text("Green: \(resolvedColor.green)")
                    Text("Blue: \(resolvedColor.blue)")
                }
                
                Text("Color JSON: \(colorJSON)")
            }
            
            Section {
                //如果已经设置了ResolvedColor,想转化为实例Color
                let resolvedColor = Color.Resolved(red: 0, green: 0.6, blue: 0.9)
                
                Rectangle()
                    .fill(
                        Color(resolvedColor).gradient
                    )
            }
        }
    }
    
    func getColor() {
        resolvedColor = color.resolve(in: environment)
        
        if let colorData = try? JSONEncoder().encode(resolvedColor) {
            colorJSON = String(decoding: colorData, as: UTF8.self)
        }
    }
}

#Preview {
    FFColorWithGETRGB()
}
