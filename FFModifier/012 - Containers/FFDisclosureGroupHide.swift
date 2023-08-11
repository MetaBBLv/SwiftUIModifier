//
//  FFDisclosureGroupHide.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/11.
//
//  如何使用DisclosureGroup隐藏和显示内容
//  SwiftUI有一个专用的DisclosureGroup视图，它显示一个披露指示器，并包含其中的内容。在最简单的形式中，他可以完全由用户控制，但也可以将其绑定到一个bool属性，确定当前内容是否可见

import SwiftUI

struct FFDisclosureGroupHide: View {
    @State private var revealDetails = true
    
    var body: some View {
        //创建一个包含大量文本的DisclosureGroup
        DisclosureGroup("Show Terms") {
            Text("噫吁嚱，危乎高哉！蜀道之难，难于上青天！蚕丛及鱼凫，开国何茫然！尔来四万八千岁，不与秦塞通人烟。西当太白有鸟道，可以横绝峨眉巅。地崩山摧壮士死，然后天梯石栈相钩连。上有六龙回日之高标，下有冲波逆折之回川。黄鹤之飞尚不得过，猿猱欲度愁攀援。青泥何盘盘，百步九折萦岩峦。扪参历井仰胁息，以手抚膺坐长叹。")
        }
        .frame(width: 300)
        .padding()
        
        Divider()
        //如果你想要跟踪披露组是否打开，可以将其绑定到bool值
        DisclosureGroup("Show Terms", isExpanded: $revealDetails) {
            Text("噫吁嚱，危乎高哉！蜀道之难，难于上青天！蚕丛及鱼凫，开国何茫然！尔来四万八千岁，不与秦塞通人烟。西当太白有鸟道，可以横绝峨眉巅。地崩山摧壮士死，然后天梯石栈相钩连。上有六龙回日之高标，下有冲波逆折之回川。黄鹤之飞尚不得过，猿猱欲度愁攀援。青泥何盘盘，百步九折萦岩峦。扪参历井仰胁息，以手抚膺坐长叹。")
        }
        .frame(width: 300)
        //t通过修改bool值，控制是否展开Content
        Spacer()
    }
}

#Preview {
    FFDisclosureGroupHide()
}
