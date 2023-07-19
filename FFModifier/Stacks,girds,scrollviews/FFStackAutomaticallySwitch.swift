//
//  FFStackAutomaticallySwitch.swift
//  FFModifier
//
//  Created by BBLv on 2023/7/18.
//
//  SwiftUI让我们可以监控当前的大小类别来决定如何布局，例如在空间充足时从HStack切换到空间有限时的VStack。只要稍加思考，我们就可以编写一个AdaptiveStack视图，自动为我们在水平和垂直布局之间切换。这使得在iPad上创建出色的布局变得更加简单，因为我的布局经自动调整以适应分割视图和滑动场景
import SwiftUI

struct AdaptiveStack<Content: View>: View {
    @Environment(\.horizontalSizeClass) var sizeClass
    let horizontalAlignment: HorizontalAlignment
    let verticalAlignment: VerticalAlignment
    let spacing: CGFloat?
    let content: () -> Content
    
    init(horizontalAlignment: HorizontalAlignment = .center, verticalAlignment: VerticalAlignment = .center, spacing: CGFloat? = nil, @ViewBuilder content: @escaping () -> Content) {
        self.horizontalAlignment = horizontalAlignment
        self.verticalAlignment = verticalAlignment
        self.spacing = spacing
        self.content = content
    }
    
    var body: some View {
        Group {
            if sizeClass == .compact {
                VStack(alignment: horizontalAlignment, spacing: spacing, content: content)
            } else {
                HStack(alignment: verticalAlignment, spacing: spacing, content: content)
            }
        }
    }
}

struct FFStackAutomaticallySwitch: View {
    
    var body: some View {
        //要在ipad模拟器下运行，尝试以不同大小分割视图-当空间不足时，你会看到ContentView自动切换到VStack
        /**工作原理：
            1.它见识horizontalSizeClass环境键值，以便每次尺寸发生变化时都会更新
            2.我给她创建了单独存储水平和垂直对齐的参数，因此可以准确的控制布局如何适应
            3.有一个可选的CGFloat，用于间距，因为这就是VStack和HStack的工作原理。如果你想要更多控制，你可以添加horizontalSpacing和verticalSpacing属性
            4.content属性是一个不接受参数并返回内容的函数（闭包），最终用户将依赖他来创建布局的视图构建器
            5.我的初始化函数提供了全部的默认参数，即使不传递任何参数来初始化也不会出错
            6.在 body 属性中，我们可以读取水平尺寸类，然后将对 content() 的调用包装在 VStack 或 HStack 中
         */
        AdaptiveStack {
            Text("Horizontal when there's lots of space")
            Text("But")
            Text("Vertical when space is restricted")
        }
        
    }
}

#Preview {
    FFStackAutomaticallySwitch()
}
