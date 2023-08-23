//
//  FFVisualEffectBlurs.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/23.
//
//  如何添加视觉效果模糊
//SwiftUI有一个非常简单的特效UIVisualEffectView，它结合了ZStack和background修饰符的一些特性。

import SwiftUI

struct FFVisualEffectBlurs: View {
    var body: some View {
        //将一些文本放在图像上，对文本应用标准模糊效果，
        ZStack {
            Image(.chrysanthemumTea)
            Text("Hi, metaBBLv")
                .padding()
                .background(.thinMaterial)
        }
        //可以调整“厚度”，材质从最薄到最后依次是：
        //.ultraThimMaterial
        //.thinNaterial
        //.regularMaterial
        //.thickMaterial
        //.ultraThickMaterial
        
        //如果你使用的是次要前景样式，SwiftUI会自动调整文本颜色，使其效果更突出
        
        ZStack {
            Image(.chrysanthemumTea)
            Text("Hi, metaBBLv")
                .foregroundStyle(.secondary)
                .padding()
                .background(.ultraThinMaterial)
        }
    }
}

#Preview {
    FFVisualEffectBlurs()
}
