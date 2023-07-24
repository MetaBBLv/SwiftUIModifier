//
//  FFLayoutsSizeClasses.swift
//  FFModifier
//
//  Created by BBLv on 2023/7/18.
//
//  如何使用尺寸类别创建不同的Layouts
//  SwiftUI通过将尺寸类暴露在环境中供我们阅读原生支持尺寸累。要使用它们，首先创建一个将存储其值的@Environment对象，然后在需要时检查该属性的值，查找.compact或.regular大小类。
//compact: 表示紧凑的尺寸类别。通常用于较小的屏幕或限制空间的界面布局。
//regular: 表示常规的尺寸类别。通常用于较大的屏幕或具有更多空间的界面布局

//通过检查 FFLayoutsSizeClasses 的 horizontalSizeClass 和 verticalSizeClass 属性来获取当前设备的尺寸类别。
//使用 SwiftUI 的 @Environment 属性包装器来获取尺寸类别信息。

import SwiftUI

struct FFLayoutsSizeClasses: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    var body: some View {
        //在 iPad 上，用户界面的尺寸类别通常是 regular，因为 iPad 屏幕较大，提供了足够的空间来显示更多内容。而在 iPhone 的竖屏模式下，尺寸类别通常是 compact，因为屏幕相对较小，需要更紧凑的布局。
        if horizontalSizeClass == .compact {
            return Text("Compact Size Class")
        } else {
            return Text("Regular Size Class")
        }
    }
}

#Preview {
    FFLayoutsSizeClasses()
}
