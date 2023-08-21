//
//  FFViewTintingAndDesaturating.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/21.
//
//  如何通过着色、去饱和度来调整视图。
//  SwiftUI可以让我们通过调整他们的亮度、色调、色温、饱和度来精确的调整视图，

import SwiftUI

struct FFViewTintingAndDesaturating: View {
    @State private var contrastAmount = 0.5
    var body: some View {
        //将Image调成红色
        Image(.mexicanMocha)
            .colorMultiply(.red)
        //饱和度调整，0.0时全灰色-1.0为原始颜色
        Image(.mushroomTagliatelle)
            .saturation(0.3)
        //甚至可以通过使用contrast()修饰符动态调整视图的对比度，0.0不会产生对比度，为灰色图像，1.0辉县市原始图像，高于1.0会增加对比度
        VStack {
            Image(.paellaAlicante)
                .contrast(contrastAmount)
            
            Slider(value: $contrastAmount , in: 0...3)
        }
    }
}

#Preview {
    FFViewTintingAndDesaturating()
}
