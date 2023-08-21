//
//  FFToggleStyle.swift
//  FFModifier
//
//  Created by BBLv on 2023/8/21.
//
//  通过ToggleStyle自定义Toggle
//  SwiftUI为我们提供了ToggleStyle协议来定制开关，任何符合此协议的结构体都必须实现一个makeBody的方法。该方法可以自定义你想要的方式实现Toggle
//  当你自定义Toggle切换时，它取决你自己自定义开启和关闭，SwiftUI不会自动完成了。

import SwiftUI

struct CheckToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button {
            configuration.isOn.toggle()
        } label: {
            Label {
                configuration.label
            } icon: {
                Image(systemName: configuration.isOn ? "checkmark.circle.fill" : "circle")
                    .foregroundStyle(configuration.isOn ? Color.accentColor : .secondary)
                    .accessibilityLabel(Text(configuration.isOn ? "Checked" : "Unchecked"))
                    .imageScale(.large)
            }
        }
        .buttonStyle(.plain)
    }
}

struct FFToggleStyle: View {
    @State private var isOn = false
    var body: some View {
        Toggle("Switch Me", isOn: $isOn)
            .toggleStyle(CheckToggleStyle())
    }
}

#Preview {
    FFToggleStyle()
}
