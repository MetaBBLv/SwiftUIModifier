//
//  FFViewLayoutPriority.swift
//  FFModifier
//
//  Created by BBLv on 2023/7/17.
//
// 如何使用layoutPriority()控制布局优先级
//  SwiftUI的layoutPriority()修饰符允许我们请求在空间有限时应在屏幕上为某些视图提供更多的空间。默认情况下，所有视图的布局优先级均为0，但如果你发现某个特定的视图被压缩，你可以使用此修饰符为其赋予更高的优先级

import SwiftUI

struct FFViewLayoutPriority: View {
    var body: some View {
        List {
            Section {
                //由于两个字符串都很长，在iPhone上会自动换行，并且SwiftUI会尝试公平的调整它们的大小，以便它们根据自己的长度获得更大的空间
                HStack{
                    Text("蜀道难，难于上青天！")
                    Text("蚕丛及鱼凫，开国何茫然！")
                }
                //这里使用layoutPriority修饰符来改变两个字符串的优先级，SwiftUI将计算低优先级文本视图所需的最小空间，然后将剩余空间提供给高优先级的文本，以便它可以占有更大的空间
                HStack{
                    Text("蜀道难，难于上青天！")
                    Text("蚕丛及鱼凫，开国何茫然！")
                        .layoutPriority(1)
                }
            }
        }
    }
}

#Preview {
    FFViewLayoutPriority()
}
