//
//  FFSafari.swift
//  FFModifier
//
//  Created by 小B同学 on 2023/7/25.
//
//  如何在Safari中打开网页链接

import SwiftUI

struct FFSafari: View {
    @Environment(\.openURL) var openURL
    var body: some View {
        List {
            Link("BBlv的掘金主页", destination: URL(string: "https://juejin.cn/user/1196684132486568")!)
            
            //由于它是一个文本链接，可以使用字体、颜色等修饰
            Link("BBlv的掘金主页", destination: URL(string: "https://juejin.cn/user/1196684132486568")!)
                .font(.title)
                .foregroundStyle(.red)
            //如果通过自定义视图，而不是文本
            Link(destination: URL(string: "https://juejin.cn/user/1196684132486568")!, label: {
                Image(systemName: "link.circle.fill")
                    .font(.largeTitle)
            })
            
            //在上下文环境中获取OpenUrl
            Button("Visit Apple") {
                openURL(URL(string: "https://juejin.cn/user/1196684132486568")!)
            }
        }
    }
}

#Preview {
    FFSafari()
}
