//
//  FFPropertyWrapperScaledMetric.swift
//  FFModifier
//
//  Created by BBLv on 2023/9/6.
//
//  什么是@ScaledMetric
//SwiftUI提供了@ScaleMetric属性包装器，用于定义根据用户的动态类型设置自动缩放的数字。

import SwiftUI

//在其基本用法中，为属性提供一个默认值，@ScaledMetric将处理其余部分。例如，根据用户的设置，以下代码将以不同的size绘制相同的图像
struct FFPropertyWrapperScaledMetric: View {
    @ScaledMetric var imageSize = 100.0
    //如果需要使缩放与特定的其他文本匹配，可以为属性包装器使用relativeTo参数，该参数可以指定要匹配的字体大小。例如，与大标题大小一起缩放
    @ScaledMetric(relativeTo: .largeTitle) var titleSize = 100.0
    var body: some View {
        Image(systemName: "cloud.sun.bolt.fill")
            .resizable()
            .frame(width: imageSize, height: imageSize)
    }
}

#Preview {
    FFPropertyWrapperScaledMetric()
}
