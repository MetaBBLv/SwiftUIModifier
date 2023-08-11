//
//  FFStackSpacerFixedsize.swift
//  FFModifier
//
//  Created by BBLv on 2023/7/18.
//
//  如何创建固定宽高的spacer
//  SwiftUI的Spacer视图会自动填充其扩展轴上的所有可用空间，这是一种奇特的说法，它在水平或垂直方向上占据了尽可能多的空间，具体要取决于你放置它们内容

import SwiftUI

struct FFStackSpacerFixedsize: View {
    var body: some View {
        List {
            Section {
                //创建2个文本视图，中间间隔符距离为50
                VStack {
                    Text("Hi, FF!")
                    Spacer()
                        .frame(height: 50)
                    Text("Hi, BBLv~")
                }
            }
            
            Section {
                //如果你为间隔符指定一个值范围，那么使用.frame(minHeight: 50, maxHeight: 500),那么它将自动占用尽可能多的空间，知道你设置的最大值。这种方式是创建视图增加了灵活性。
                //某些情况下，你希望指定与其布局方向无关的间隔符大小，例如，如果你的视图的排列方向可能是动态的（VStack或HStack），你的需求时无论哪个方向，两个视图之间的间隔符都添加最少50距离
                VStack {
                    Text("Hi, FF!")
                    Spacer(minLength: 50)
                    Text("Hi, BBLv~")
                }
                // 这是最小的长度，因此如果可用空间更多，spacer会变大
            }
        }
    }
}

#Preview {
    FFStackSpacerFixedsize()
}
