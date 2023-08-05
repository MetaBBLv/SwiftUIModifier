//
//  FFDarkMode.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/5.
//
//  如何在命案模式下显示不同的图像和其他视图
//  SwiftUI可以根据用户当前的外观设置直接从你的资产目录中加载明暗模式的图像，但如果不使用Asset catalog，例如，如果你下载图像或在本地生成他们，你需要做额外的工作。
//  最简单的解决方案是创建一个同事处理明暗模式图像的新视图

import SwiftUI

struct AdaptiveImage: View {
    @Environment(\.colorScheme) var colorScheme
    let light: Image
    let dark: Image
    
    @ViewBuilder var body: some View {
        if colorScheme == .light {
            light
        } else {
            dark
        }
    }
}

//它保留了相同的便捷初始化器，但现在添加了接受闭包的替代方法。所以，现在可以利用闭包在明暗之下切换更复杂的代码
struct AdaptiveView<T: View, U: View>: View {
    @Environment(\.colorScheme) var colorScheme
    let light: T
    let dark: U
    
    init(light: T, dark: U) {
        self.light = light
        self.dark = dark
    }
    
    init(light: () -> T, dark: () -> U) {
        self.light = light()
        self.dark = dark()
    }
    
    @ViewBuilder var body: some View {
        if colorScheme == .light {
            light
        } else {
            dark
        }
    }
}

struct FFDarkMode: View {
    var body: some View {
        //这样可以传入两张图，SwiftUI会自动选择正确的明暗模式。
        AdaptiveImage(light: Image(systemName: "sun.max"), dark: Image(systemName: "moon"))
        //如果你只是想在明暗模式的之间切换，这很有效，但如果想要添加一些额外的代码，我们可以创建一个包装器视图，能够根据明暗模式显示完全不同的内容。
        VStack {
            AdaptiveView {
                VStack {
                    Text("Light mode")
                    Image(systemName: "sun.max")
                }
            } dark: {
                HStack {
                    Text("Dark mode")
                    Image(systemName: "moon")
                }
            }
            .font(.largeTitle)

        }
    }
}

#Preview {
    FFDarkMode()
}
