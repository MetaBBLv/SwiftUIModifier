//
//  FFViewPaddingAroundColor.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/19.
//
//  如何在视图周围填充颜色
//  padding()修饰符允许我们在视图周围添加一些间距，background()修饰符允许我们设置背景颜色。

import SwiftUI

struct FFViewPaddingAroundColor: View {
    var body: some View {
        Text("metaBBLv with Swift")
            .background(.red)
            .foregroundStyle(.white)
            .padding()
        
        Divider()
        Text("metaBBLv with Swift")
            .padding()
            .background(.red)
            .foregroundStyle(.white)
        //这两段code可能看起来比较相似，但是他们产生不同的结果，因为使用修饰符的顺序很重要。在第二个例子中，视图被填充，然后着色，这意味着填充的范围也被着色。相比之下，第一个例子就是先着色再填充。
    }
}

#Preview {
    FFViewPaddingAroundColor()
}
