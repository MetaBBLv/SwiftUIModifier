//
//  FFViewChangeBackground.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/21.
//
//  如何改变列表、文本编辑器等的背景颜色
//  一些SwiftUI是有有一个默认的背景颜色，它会覆盖你自己想要的任何颜色，但是如果你使用scrollCOntentBackground()修饰符，你可以隐藏默认背景并用其他颜色替代。

import SwiftUI

struct FFViewChangeBackground: View {
    var body: some View {
        //删除List的默认颜色，替换为.indigo
        List(0..<100) { i in
            Text("Exampl \(i)")
        }
        .scrollContentBackground(.hidden)
        .background(.indigo)
    }
}

#Preview {
    FFViewChangeBackground()
}
