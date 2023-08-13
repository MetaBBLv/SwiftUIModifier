//
//  FFnavigationPushView.swift
//  FFModifier
//
//  Created by 小B同学 on 2023/8/13.
//
//  如何将新视图push到NavigationStack上
//  SwiftUI允许我们使用NavigationLink将任何视图推送到navigationStack上，在其最简单的形式中，你可以为其标题提供字符串和目标视图作为尾随闭包

import SwiftUI

//创建一个简单的DetailView结构，然后通过NavigationStack显示它
struct DetailView_013: View {
    var body: some View {
        Text("This is the detail view")
    }
}

struct FFnavigationPushView: View {
    var body: some View {
        NavigationStack {
            VStack {
                NavigationLink("Show Detail View") {
                    DetailView_013()
                }
                
                //如果你需要对Label进行更多的自定义，那么使用尾随闭包。例如，使用Label视图而不是简单的字符串
                NavigationLink {
                    DetailView_013()
                } label: {
                    Label("Show Detail View - Label", systemImage: "globe")
                }
                //SwiftUI将自动将链接样式设置为按钮，以便用户知道他们是交互式的。你可以通过将.buttonStule(.plain)应用在NavigationLink禁用此行为
            }
            .navigationTitle("navigation")
        }
    }
}

#Preview {
    FFnavigationPushView()
}
