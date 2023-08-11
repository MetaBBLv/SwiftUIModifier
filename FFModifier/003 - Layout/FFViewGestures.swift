//
//  FFViewGestures.swift
//  FFModifier
//
//  Created by BBLv on 2023/7/17.
//
//  如何阻止系统手势干扰你自己的手势
//  SwiftUI的defersSystemGestures修饰符允许我们的手势优先于系统自己的内置手势。这在很多地方都很重要，例如频繁滑动的游戏，或者当你自己将手势放在屏幕边缘时

import SwiftUI

struct FFViewGestures: View {
    @State private var input = 0.0
    
    var body: some View {
        /**在iOS上，它做了三件不同的事情：
            1、如果用户从顶部向下拉，它们会看到一个需要再次拉动的小选项卡，而不是出现控制中心。
            2、主屏幕指示器将淡出至较低的不透明度，如果用户直接拖动该淡出的主屏幕指示器，则将其淡入。然后，可以再次向上活动以进入任务切换器或者主屏幕
            3、如果用户从底部向上滑动到主页指示器的人一次，则会发生自定义的拖动手势
         */
        
        Text("Current value: \(input)")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .contentShape(Rectangle())
            .gesture(
                DragGesture().onChanged({ value in
                    input = value.location.y - value.startLocation.y
                })
            )
            .defersSystemGestures(on: .vertical)
    }
}

#Preview {
    FFViewGestures()
}
