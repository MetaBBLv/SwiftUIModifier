//
//  FFViewMask.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/21.
//
//  如何用一个视图掩盖另一个视图
//  SwiftUI为我们提供了mask()修饰符，用于用一个遮罩另外一个，这意味着你可以用文本遮罩一个图像，或者。。。。

import SwiftUI

struct FFViewMask: View {
    var body: some View {
        //创建一个300*300的条纹图像，然后使用文本“SWIFT！”遮罩，这样这些字母就可以和图像合并。
        Image(.fullEnglish)
            .frame(width: 300, height: 300)
            .mask {
                Text("SWIFT!")
                    .font(.system(size: 72))
            }
        //mask()修饰符与clipShape()不同，因为它也应用遮罩视图中的任何透明度。你可以根据遮罩的透明度在底层视图中设置空洞。另一方面，clipShape()值调整应用他的视图的外部形状。
    }
}

#Preview {
    FFViewMask()
}
