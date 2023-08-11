//
//  FFTabViewBadge.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/11.
//
//  如何给TabView或List-cell添加一个badge
//  SwiftUI的Badge()修饰符允许我们向TabView item视图和list-cell添加数字和文本，目的将用户的注意力吸引到一些弥补状态信息上--例如，TabView上的数字标识未读消息技术

import SwiftUI

struct FFTabViewBadge: View {
    var body: some View {
        TabView {
            VStack {
                List {
                    Text("Wi-Fi")
                        .badge("Lan solo")
                    Text("Bluetooth")
                        .badge("On")
                }
                
//                Text("Your home screen here")
            }
            .tabItem {
                Label("Home", systemImage: "house")
            }
            .badge(5)
        }
        //badge同样适用于List-cell，并自动以第二种颜色显示为右对齐文本。
    }
}

#Preview {
    FFTabViewBadge()
}
