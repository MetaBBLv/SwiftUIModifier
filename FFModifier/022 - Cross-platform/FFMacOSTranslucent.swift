//
//  FFMacOSTranslucent.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/28.
//
//  如何在macOS上获取半透明list
//  macOS的一个微妙但重要的功能是当窗口处于活跃状态时，侧边栏会自动变的稍微透明，然后当窗口移动到背景时变的不透明 - 这是想用户展示那个窗口处于活跃状态的一个小提示，但也让他们的背景展示出来，给他们一些关于他们的环境的背景。
//SwiftUI可以使用listStyle()修饰符来创建这些半透明侧边栏List，传入.sidebar。

import SwiftUI

struct FFMacOSTranslucent: View {
    var body: some View {
        NavigationStack {
            List(1..<51) {
                Text("meta \($0)")
            }
            .listStyle(.sidebar)
        }
        //在iOS和iPadOS上，.siderbar不提供半透明背景，但会影响单元格样式。
    }
}

#Preview {
    FFMacOSTranslucent()
}
