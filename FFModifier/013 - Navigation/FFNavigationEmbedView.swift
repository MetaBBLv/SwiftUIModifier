//
//  FFNavigationEmbedView.swift
//  FFModifier
//
//  Created by 小B同学 on 2023/8/13.
//
//  如何在NavigationView中嵌入视图
//  SwiftUi的NavigationStack或多或少的映射到UIKit的UINavigationController，因为它显示内容，它能够处理视图之间的导航，比在屏幕顶部防止导航栏。
//

import SwiftUI

struct FFNavigationEmbedView: View {
    var body: some View {
        //以最简单的方式，将Text放入NavigationStack中
        NavigationStack {
            Text("This is a great app")
            //然而，顶部导航栏是空的。因此，你通常会在嵌入的任何内容上使用navigationTitle()修饰符，因此你可以在屏幕顶部添加标题
            Text("Swift")
                .navigationTitle("Welcome")
            //还有第二个修饰符，navigationBarTitleDisplayMode()，他让我们可以控制室是使用大标题还是小标题的内联标题。例如，默认情况下，视图将从呈现的任何视图继承其大标题的显示模式，或者如果是初始视图，则使用大标题。但是，如果你更愿意手动启用或禁用大标题，你应该使用.navigationBarTitleDisoplayMode()
            Text("SwiftUI")
                .navigationTitle("Meta BBlv")
                .navigationBarTitleDisplayMode(.inline)
            //这将产生小的导航标题，但你可以使用.large来设置一个大标题
        }
    }
}

#Preview {
    FFNavigationEmbedView()
}
