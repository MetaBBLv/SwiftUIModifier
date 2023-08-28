//
//  FFWatchOSCarousel.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/28.
//
//  如何在watchOS上制作轮播列表
//  wathhOS有一种特别常见的列表样式，可以使用以下的方式轻松复制，List列表中的行在移动到屏幕上时滑动并放大，在移出屏幕时滑动并缩小。
//  要启用此轮博效果，使用.listStyle()修饰符和.carousel属性。

import SwiftUI

#if (watchOS)
struct FFWatchOSCarousel: View {
    var body: some View {
        List(1..<51) {
            Text("meta \($0)")
        }
        .listStyle(.carousel)
    }
}


#Preview {
    FFWatchOSCarousel()
}
#endif
