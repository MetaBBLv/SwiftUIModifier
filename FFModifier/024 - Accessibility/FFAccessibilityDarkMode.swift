//
//  FFDarkMode.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/31.
//
//  如何检测深色模式
//SwiftUI可以使用环境检测键（colorScheme）检测当前是否启用了深色模式或浅色模式。如果使用了@environment声明了此属性，就可以在视图中引用它，并且当配色方案更改时将自动加载

import SwiftUI

struct FFAccessibilityDarkMode: View {
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        Text(colorScheme == .dark ? "META BBLV in dark mode" : "META BBLV in light mode")
    }
}

#Preview {
    FFAccessibilityDarkMode()
}
