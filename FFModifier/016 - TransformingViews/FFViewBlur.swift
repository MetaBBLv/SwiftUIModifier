//
//  FFViewBlur.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/21.
//
//  如何模糊视图
//  blur()修饰符允许我们根据自己的选择对视图附加实时的高斯模糊。

import SwiftUI

struct FFViewBlur: View {
    @State private var blurAmount = 0.0
    var body: some View {
        //对图像使用模糊
        Image(.freshBakedCroissantThumb)
            .resizable()
            .frame(width: 300, height: 300)
            .blur(radius: 20)
        Divider()
        //对文本使用模糊
        Text("Meta BBlv in Swift")
            .blur(radius: 2)
        Divider()
        //通过Slider动态调整模糊效果
        VStack {
            Image(.macaronsGaloreThumb)
                .resizable()
                .frame(width: 300, height: 300)
                .blur(radius: blurAmount)
            Slider(value: $blurAmount, in:  0...20)
        }
        .padding()
    }
}

#Preview {
    FFViewBlur()
}
