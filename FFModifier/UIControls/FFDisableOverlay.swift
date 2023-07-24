//
//  FFDisableOverlay.swift
//  FFModifier
//
//  Created by BBLv on 2023/7/24.
//
//  如何禁用Button和NavigationLink内不想的叠加颜色
//  在iOS上，NavigationLink或BUtton内绘制图像几乎肯定不会按照你的预期运行，整个图像将被不透明的蓝色或视图中任何强调色覆盖。
//  有两种方法可以解决这个问题，你选择哪个取决于你想要的行为


import SwiftUI

struct FFDisableOverlay: View {
    var body: some View {
        //使用renderMode()模式来修饰符来实现略有不同的结果。
        List {
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
}

#Preview {
    FFDisableOverlay()
}
