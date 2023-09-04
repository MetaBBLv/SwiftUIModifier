//
//  FFScrollViewStartBottom.swift
//  FFModifier
//
//  Created by BBLv on 2023/7/19.
//
//  如何让ScrollView在底部开始
//  默认情况下，SwiftUI的ScrollView从顶部开始滚动，但如果你想创建想Apple的消息app那样的UI，你可以使用带有.bottom初始锚点的scrollPosition()修饰符要求滚动视图从底部开始

import SwiftUI

struct FFScrollViewStartBottom: View {
    var body: some View {
        //例如，这在滚动视图中显示50个文本视图，但要求滚动视图从底部而不是顶部开始
        ScrollView {
            ForEach(0..<50) { i in
                Text("Item \(i)")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(.blue)
                    .clipShape(.rect(cornerRadius: 25))
            }
        }
//        .scrollPosition(initialAnchor: .bottom)
        
        //如果你的UI在用户不滚动的情况下发生某种变化（例如，如果出现假盘，或者你调整ScrollView的大小），则滚动位置将保持锚定在底部。但是，如果用户手动调整滚动位置，他将正常自由的滚动
        //提示:initialAnchor参数时任何UIPoint，因此你可以使用.trailing从右边边缘启动水平滚动的视图
    }
}

#Preview {
    FFScrollViewStartBottom()
}
