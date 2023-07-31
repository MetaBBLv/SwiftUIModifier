//
//  FFDisableOverlay.swift
//  FFModifier
//
//  Created by BBLv on 2023/7/24.
//
//  如何禁用Button和NavigationLink的闪烁
//  在SwiftUI中，Button和NavigationLink中的图像默认会显示覆盖颜色，以提供按下按钮或激活链接时的视觉反馈。如果你想禁用这种覆盖颜色，你可以使用自定义按钮样式来避免应用任何覆盖效果。


import SwiftUI

struct FFDisableOverlay: View {
    var body: some View {
        //使用renderMode()模式来修饰符来实现略有不同的结果。
        NavigationStack {
            NavigationLink {
                Text("Detail View Here")
            } label: {
                Image("strawberry-surprise")
                    .renderingMode(.original)
            }
        }
        .frame(height: 200)
        
        //作为替代方案，将buttonStyle设定为.plain
        NavigationStack {
            NavigationLink {
                Text("Detail View Here")
            } label: {
                Image("mexican-mocha")
            }
            .buttonStyle(.plain)
        }
        .frame(height: 200)
        
        //普通Button
        Button {
            print("Button click")
        } label: {
            Image("cheese-toastie")
        }
        .buttonStyle(.plain)
        //在xcode12，需要使用PlainButtonStyle()
        //区别很微妙，但是很重要，如果你在列表中使用按钮，则使用buttonStyle(.plain)将意味着只能点击按钮内容直接周围的空间，而如果你使用.renderingMode(.original)，则整个单元格都可以点击
    }
}

#Preview {
    FFDisableOverlay()
}
