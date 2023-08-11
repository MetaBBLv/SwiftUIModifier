//
//  FFImageShapes.swift
//  FFModifier
//
//  Created by BBLv on 2023/7/11.
//
// SwiftUI由很多种内置形状，例如矩形、圆形和圆角矩形

import SwiftUI

struct FFImageShapes: View {
    var body: some View {
        List {
            //200 * 200的红色矩形
            Rectangle()
                .fill(.red)
                .frame(width: 200, height: 200)
            
            //100 * 100的蓝色圆形
            Circle()
                .fill(.blue)
                .frame(width: 100, height: 100)
            
            //圆角矩形
            RoundedRectangle(cornerRadius: 25.0)
                .fill(.green)
                .frame(width: 150, height: 100)
            
            // Capsule()是SwiftUI提供的一种特殊的圆角矩形,其中最短的边永远是完全圆角的，类似Slider背景视图
            Capsule()
                .fill(.green)
                .frame(width: 150, height: 100)
            
        }
    }
}

#Preview {
    FFImageShapes()
}
